import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer whenOrDefault()
@sealed
@immutable
class TopMatchWhenOrDefaultWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrDefaultWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) {
  /// return sunny?.call(weather) ?? orDefault;
  /// }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrDefaultIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}?.call($topLower) ?? orDefault;',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenOrDefaultIfs() =>
      manifest.items.map(topMatchWhenOrDefaultIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrDefaultBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrDefaultIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenOrDefaultItemArgs() =>
      manifest.items.map(topMatchGenericNArg);

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenOrDefaultArgs() => [
        ...topMatchWhenOrDefaultItemArgs(),
        topMatchGenericNNArgOrDefault(),
      ];

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrDefaultStart() => [
        'R whenOrDefault$topMatchParam',
        topMatchWhenOrDefaultArgs()
            .joinArgsFull()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// R whenOrDefault<R extends Object?>(item..., required orDefault) {...}
  @nonVirtual
  String topMatchWhenOrDefault() => [
        topMatchWhenOrDefaultStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrDefault(),
        topMatchWhenOrDefaultBody(),
        '}',
      ].joinLines();
}
