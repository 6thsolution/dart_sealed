import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';

/// write docs for sub classes
@sealed
@immutable
class SubDocWriter extends BaseWriter {
  @visibleForTesting
  static const equalityNames = ['data', 'identity', 'distinct'];

  const SubDocWriter(Source source) : super(source);

  /// ex. ((WeatherRainy : Weather) rainy){int rain} with data equality
  @nonVirtual
  String write(ManifestItem item) => [
        [
          [
            [
              item.name.withBraKet(),
              ' : ',
              source.manifest.name.withBraKet(),
            ].joinParts().withParenthesis(),
            _paramsDoc(),
            ' ',
            item.shortName,
          ].joinParts().withParenthesis(),
          _fieldsDoc(item),
        ].joinParts(),
        'with ${_equality(item.equality)} equality',
        if (item.isWrapped) 'with wrap',
      ].insertEmptyLinesBetween().addDocComments().joinLines();

  String _equality(ManifestEquality equality) => equalityNames[equality.index];

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
