import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_cast_utils_writer.dart';

/// top cast writer
@immutable
@sealed
class TopCastWriter extends BaseCastUtilsWriter {
  const TopCastWriter(Source source) : super(source);

  /// ex. isRainy()
  @nonVirtual
  @visibleForTesting
  String topCastIs(ManifestItem item) =>
      'bool$nn is${subUpper(item)}() => this ${isSub(item)};';

  @nonVirtual
  @visibleForTesting
  Iterable<String> topCastsIs() => manifest.items.map(topCastIs);

  /// ex. asRainy()
  @nonVirtual
  @visibleForTesting
  String topCastAs(ManifestItem item) =>
      '${subCall(item)}$nn as${subUpper(item)}() =>'
      ' this ${asSub(item)};';

  @nonVirtual
  @visibleForTesting
  Iterable<String> topCastsAs() => manifest.items.map(topCastAs);

  /// ex. asRainyOrNull()
  @nonVirtual
  @visibleForTesting
  String topCastAsOrNull(ManifestItem item) => [
        '${subCall(item)}$n as${subUpper(item)}OrNull() {',
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
