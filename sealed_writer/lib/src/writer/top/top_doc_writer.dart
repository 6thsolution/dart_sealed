import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';

/// write docs for base class
@sealed
@immutable
class TopDocWriter extends BaseWriter {
  static const equalityNames = ['data', 'identity', 'distinct'];

  const TopDocWriter(Source source) : super(source);

  String write() => [
        '${_topDoc()} {',
        ..._itemsDoc(),
        '}',
      ].insertEmptyLinesBetween().addDocComments().joinLines();

  String _equality(ManifestEquality equality) => equalityNames[equality.index];

  Iterable<String> _itemsDoc() => source.manifest.items.map(_itemDoc);

  String _itemDoc(ManifestItem item) => [
        [
          item.name.withBraKet(),
          ' ',
          item.shortName,
        ].joinParts().withParenthesis(),
        _fieldsDoc(item),
        ' with ${_equality(item.equality)} equality',
        if (item.isWrapped) ' with wrap',
      ].joinParts();

  String _topDoc() => [
        source.manifest.name.withBraKet(),
        _paramsDoc(),
      ].joinParts();

  String _fieldsDoc(ManifestItem item) =>
      item.fields.map(_fieldDoc).joinArgsSimple().withBraces();

  String _fieldDoc(ManifestField field) => [
        field.type.name.withBraKet(),
        if (field.type.isNullable) '?',
        ' ',
        field.name,
      ].joinParts();

  String _paramsDoc() =>
      source.manifest.params.map(_paramDoc).joinArgsSimple().withLtGtOrNot();

  String _paramDoc(ManifestParam param) => [
        param.name.withBraKet(),
        ' extends ',
        param.bound.name.withBraKet(),
        if (param.bound.isNullable) '?',
      ].joinParts();
}
