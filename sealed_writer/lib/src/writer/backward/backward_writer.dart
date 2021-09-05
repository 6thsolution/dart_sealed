import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// mimic original manifest code.
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

  const BackwardWriter(Manifest manifest) : super(manifest);

  /// single-line
  String _topAnnotation() => '@Sealed()';

  /// single-line
  String _topStart() => 'abstract class _$topDec';

  String _arg(ManifestField field) => '${typeSL(field.type)} ${field.name}';

  String _args(ManifestItem item) =>
      item.fields.map(_arg).joinArgsSimple().withParenthesis();

  /// single-line
  String _method(ManifestItem item) => [
        'void ',
        subLower(item),
        _args(item),
        ';',
      ].joinParts();

  /// single-line
  String _equalityAnnotation(ManifestItem item) =>
      '@WithEquality(${_equality(item.equality)})';

  /// single-line
  String _nameAnnotation(ManifestItem item) => "@WithName('${item.name}')";

  /// maybe multi-line
  String _group(ManifestItem item) => [
        _equalityAnnotation(item),
        _nameAnnotation(item),
        _method(item),
      ].joinLines();

  /// single-line
  String _common(ManifestField field) =>
      '${typeSL(field.type)} get ${field.name};';

  Iterable<String> _groups() => [
        ...manifest.fields.map(_common),
        ...manifest.items.map(_group),
      ];

  /// write
  String write() => [
        _topAnnotation(),
        _topStart(),
        '{',
        ..._groups().insertEmptyLinesBetween(),
        '}',
      ].joinLines();
}
