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

  /// single-line
  String _wrapAnnotation() => '@WithWrap()';

  String _group(ManifestItem item) => [
        if (item.isWrapped) _wrapAnnotation(),
        _equalityAnnotation(item),
        _nameAnnotation(item),
        _method(item),
      ].joinLines();

  Iterable<String> _groups() => manifest.items.map(_group);

  /// write
  String write() => [
        _topAnnotation(),
        _topStart(),
        '{',
        ..._groups().insertEmptyLinesBetween(),
        '}',
      ].joinLines();

  /// write as comments
  String writeAsComment() => write().splitLines().addComments().joinLines();
}
