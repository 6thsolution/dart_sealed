import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// source writer
@sealed
@immutable
class SubEquatableWriter extends BaseUtilsWriter {
  const SubEquatableWriter(Source source) : super(source);

  String fieldName(ManifestField field) => field.name;

  Iterable<String> subEquatableFieldNames(ManifestItem item) =>
      item.fields.map(fieldName);

  /// List<Object?> get props => [a, b, ...];
  String subEquatableEquality(ManifestItem item) => [
        annotationOverride,
        [
          'List<Object$n>$nn get props => [',
          subEquatableFieldNames(item).joinArgsFull(),
          '];',
        ].joinParts(),
      ].joinLines();
}
