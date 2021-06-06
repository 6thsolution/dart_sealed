import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_constructor_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_copy_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_doc_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_equatable_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_field_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_to_string_writer.dart';

/// source writer
@sealed
@immutable
class SubWriter extends BaseUtilsWriter {
  SubWriter(Source source)
      : subCopyWriter = SubCopyWriter(source),
        subToStringWriter = SubToStringWriter(source),
        subFieldWriter = SubFieldWriter(source),
        subConstructorWriter = SubConstructorWriter(source),
        subEquatableWriter = SubEquatableWriter(source),
        subDocWriter = SubDocWriter(source),
        super(source);

  final SubCopyWriter subCopyWriter;

  final SubToStringWriter subToStringWriter;

  final SubFieldWriter subFieldWriter;

  final SubConstructorWriter subConstructorWriter;

  final SubEquatableWriter subEquatableWriter;

  final SubDocWriter subDocWriter;

  /// has nullable fields
  bool hasNullable(ManifestItem item) =>
      item.fields.map((field) => field.type).any((type) => type.isNullable);

  /// subclass start
  String subClassStart(ManifestItem item) => [
        subDocWriter.write(item),
        annotationImmutable,
        [
          'class ${subDec(item)} extends $topCall',
          if (item.equality == ManifestEquality.data) ' with EquatableMixin',
        ].joinParts(),
      ].joinLines();

  /// bool operator ==(Object other) => false;
  String subDistinctEquality() => [
        annotationOverride,
        'bool$nn operator ==(Object other) => false;',
      ].joinLines();

  /// subclass
  String subClass(ManifestItem item) => [
        subClassStart(item),
        '{',
        subConstructorWriter.subConstructorDeclaration(item),
        subFieldWriter.subFieldDeclarations(item),
        if (!hasNullable(item) && !isGeneric && !item.isWrapped)
          subCopyWriter.subCopyDeclaration(item),
        subToStringWriter.subToString(item),
        if (item.equality == ManifestEquality.data)
          subEquatableWriter.subEquatableEquality(item),
        if (item.equality == ManifestEquality.distinct) subDistinctEquality(),
        '}',
      ].joinMethods();

  Iterable<String> subClasses() => manifest.items.map(subClass);
}
