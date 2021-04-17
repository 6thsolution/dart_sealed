import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer whenOrThrow()
@sealed
@immutable
class TopMatchWhenOrThrowWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrThrowWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny && sunny != null) {
  /// return sunny(weather);
  /// }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrThrowIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)} && ${subLower(item)} != null',
        code: 'return ${subLower(item)}($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenOrThrowIfs() =>
      manifest.items.map(topMatchWhenOrThrowIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrThrowBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrThrowIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenOrThrowArgs() =>
      manifest.items.map(topMatchGenericNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrThrowStart() => [
        'R whenOrThrow$topMatchParam',
        topMatchWhenOrThrowArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrThrow<R extends Object?>(item...) {...}
  @nonVirtual
  String topMatchWhenOrThrow() => [
        topMatchWhenOrThrowStart(),
        '{',
        topMatchWhenOrThrowBody(),
        '}',
      ].joinLines();
}
