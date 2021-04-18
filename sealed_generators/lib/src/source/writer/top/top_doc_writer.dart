import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// write docs for base class
///
/// todo test methods
@sealed
@immutable
class TopDocWriter extends BaseWriter {
  @visibleForTesting
  static const equalityNames = ['data', 'identity', 'distinct'];

  const TopDocWriter(Source source) : super(source);

  @nonVirtual
  String write() => [
        '${_topDoc()} {',
        ...source.manifest.items.map(_itemDoc),
        '}',
      ].insertEmptyLinesBetween().addDocComments().joinLines();

  String _equality(Equality equality) => equalityNames[equality.index];

  String _topDoc() => [
        source.manifest.name,
        source.manifest.params.map(_paramDoc).joinArgsSimple().withLtGtOrNot(),
      ].joinParts();

  String _itemDoc(ManifestItem item) => [
        '(${item.fullName} ${item.shortName.toLowerStart()})',
        item.fields.map(_fieldDoc).joinArgsSimple().withBraces(),
        ' with ${_equality(item.equality)} equality'
      ].joinParts();

  String _fieldDoc(ManifestField field) => [
        field.type.name,
        if (field.type.isNullable) '?',
        ' ',
        field.name,
      ].joinParts();

  String _paramDoc(ManifestParam param) => [
        param.name,
        ' extends ',
        param.bound.name,
        if (param.bound.isNullable) '?',
      ].joinParts();
}
