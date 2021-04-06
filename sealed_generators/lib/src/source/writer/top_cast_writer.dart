import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base_cast_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// top cast writer
@immutable
@sealed
class TopCastWriter extends BaseCastUtilsWriter {
  const TopCastWriter(Source source) : super(source);

  /// ex. isRainy()
  @nonVirtual
  @visibleForTesting
  String topCastIs(ManifestItem item) =>
      'bool is${subShort(item)}() => this ${isSub(item)};';

  @nonVirtual
  @visibleForTesting
  Iterable<String> topCastsIs() => manifest.items.map(topCastIs);

  /// ex. asRainy()
  @nonVirtual
  @visibleForTesting
  String topCastAs(ManifestItem item) =>
      '${subFull(item)}$nn as${subShort(item)}() =>'
      ' this ${asSub(item)};';

  @nonVirtual
  @visibleForTesting
  Iterable<String> topCastsAs() => manifest.items.map(topCastAs);

  /// ex. asRainyOrNull()
  @nonVirtual
  @visibleForTesting
  String topCastAsOrNull(ManifestItem item) => [
        '${subFull(item)}$n as${subShort(item)}OrNull() {',
        initThisValue(),
        'return $topLower ${isSub(item)} ? $topLower : null;',
        '}',
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topCastsAsOrNull() => manifest.items.map(topCastAsOrNull);

  @nonVirtual
  Iterable<String> topCastMethods() => [
        ...topCastsIs(),
        ...topCastsAs(),
        ...topCastsAsOrNull(),
      ];
}
