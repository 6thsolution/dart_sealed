import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// mimic original manifest code.
///
/// todo test methods
@sealed
@immutable
class BackwardWriter extends BaseUtilsWriter {
  @visibleForTesting
  static const avoidConflict = true;

  const BackwardWriter(Source source) : super(source);

  String _topAnnotation() => '@Sealed(equality: ${source.options.equality})';

  String _topStart() => [
        'abstract class _$top',
        if (avoidConflict) '\$',
        genericDec,
      ].joinParts();

  String _field(ManifestField field) => '${typeSL(field.type)} ${field.name}';

  Iterable<String> _fields(ManifestItem item) => item.fields.map(_field);

  String _item(ManifestItem item) => [
        'void ',
        subLower(item),
        _fields(item).joinArgsSimple().withParenthesis(),
        ';',
      ].joinParts();

  Iterable<String> _items() => manifest.items.map(_item);

  @nonVirtual
  String write() => [
        _topAnnotation(),
        _topStart(),
        '{',
        ..._items(),
        '}',
      ].joinLines();
}
