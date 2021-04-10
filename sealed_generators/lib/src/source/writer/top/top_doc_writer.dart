import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// write docs for base class
///
/// todo test methods
@sealed
@immutable
class TopDocWriter extends BaseWriter {
  const TopDocWriter(Source source) : super(source);

  String write() => [
        '${_topDoc()} {',
        ...source.manifest.items.map(_itemDoc),
        '}',
        _equalityDoc(),
      ].insertEmptyLinesBetween().addDocComments().joinLines();

  String _equalityDoc() => 'with ${_equality()} equality.';

  String _equality() {
    switch (source.options.equality) {
      case SealedEquality.data:
        return 'data';
      case SealedEquality.identity:
        return 'identity';
      case SealedEquality.distinct:
        return 'distinct';
      default:
        throw AssertionError();
    }
  }

  String _topDoc() => [
        source.manifest.name,
        source.manifest.params.map(_paramDoc).joinArgsSimple().withLtGtOrNot(),
      ].joinParts();

  String _itemDoc(ManifestItem item) => [
        '${item.name}',
        item.fields.map(_fieldDoc).joinArgsSimple().withParenthesis(),
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
