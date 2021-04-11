import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/legacy_fixer.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:source_gen/source_gen.dart';

/// apply to manifest
@sealed
@immutable
class TypeOverrideNamedReader {
  static const String metaClassName = 'SealedOverrideNamed';

  final Options options;

  @visibleForTesting
  final OverrideNamedLegacyFixer fixer;

  const TypeOverrideNamedReader(this.options)
      : fixer = const OverrideNamedLegacyFixer();

  TypeOverrideNamed? readOrNull(MethodElement method) {
    final reader = _metaReaderOrNull(method);
    if (reader == null) {
      return null;
    } else {
      final map = _readMap(reader);
      final override = _mapOverride(map);
      return options.isNullSafe ? override : fixer.fix(override);
    }
  }

  TypeOverrideNamed _mapOverride(Map<String, String> map) => TypeOverrideNamed(
        map: map.map(
          (k, v) => MapEntry(k, v.readType()),
        ),
      );

  Map<String, String> _readMap(ConstantReader reader) {
    final map = reader.read('map').mapValue;
    final out = <String, String>{};
    for (final e in map.entries) {
      final key = e.key?.toStringValue();
      final value = e.value?.toStringValue();
      require(
        key != null && key.isGenFieldName(),
        () => 'malformed key: $key',
      );
      require(
        value != null && value.isSimpleOrNullableTypeName(),
        () => 'malformed value: $value',
      );
      out[key!] = value!;
    }
    return out;
  }

  ConstantReader? _metaReaderOrNull(MethodElement method) {
    final readers = method.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) =>
              e?.type?.getDisplayString(withNullability: false) ==
              metaClassName,
        )
        .map((e) => ConstantReader(e))
        .toList();
    require(
      readers.isSingleOrEmpty,
      'can have at most one $metaClassName annotation',
    );
    return readers.firstOrNull;
  }
}
