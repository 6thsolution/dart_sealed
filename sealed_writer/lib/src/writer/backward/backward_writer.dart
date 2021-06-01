import 'package:meta/meta.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// mimic original manifest code.
@sealed
@immutable
class BackwardWriter extends BaseUtilsWriter {
  /// map equality
  static const _equalityMapping = {
    ManifestEquality.data: 'Equality.data',
    ManifestEquality.identity: 'Equality.identity',
    ManifestEquality.distinct: 'Equality.distinct',
  };

  /// ex. Equality.data
  static String _equality(ManifestEquality equality) =>
      _equalityMapping[equality]!;

  const BackwardWriter(Source source) : super(source);

  String _topAnnotation() => '@Sealed()';

  String _topStart() => 'abstract class _$top\$$genericDec';

  String _field(ManifestField field) => '${typeSL(field.type)} ${field.name}';

  Iterable<String> _fields(ManifestItem item) => item.fields.map(_field);

  String _item(ManifestItem item) => [
        if (item.isWrapped) '@WithWrap()',
        _itemEqualityAnnotation(item),
        _itemNameAnnotation(item),
        _itemMethod(item),
      ].joinLines();

  String _itemEqualityAnnotation(ManifestItem item) =>
      '@WithEquality(${_equality(item.equality)})';

  String _itemNameAnnotation(ManifestItem item) => "@WithName('${item.name}')";

  String _itemMethod(ManifestItem item) => [
        'void ',
        subLower(item),
        _fields(item).joinArgsSimple().withParenthesis(),
        ';',
      ].joinParts();

  Iterable<String> _items() => manifest.items.map(_item);

  /// write docs
  String write() => [
        _topAnnotation(),
        _topStart(),
        '{',
        ..._items().insertEmptyLinesBetween(),
        '}',
      ].joinLines();
}
