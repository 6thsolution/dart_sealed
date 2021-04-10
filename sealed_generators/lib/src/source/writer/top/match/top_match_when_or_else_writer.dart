import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class TopMatchWhenOrElseWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrElseWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrElseIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return (${subLower(item)} ?? orElse)($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenOrElseIfs() =>
      manifest.items.map(topMatchWhenOrElseIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrElseIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenOrElseItemArgs() =>
      manifest.items.map(topMatchGenericNArg);

  @nonVirtual
  @visibleForTesting
  List<String> topMatchWhenOrElseArgs() => [
        ...topMatchWhenOrElseItemArgs(),
        topMatchGenericNNArgOrElse(),
      ];

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseStart() => [
        'R whenOrElse$topMatchParam',
        topMatchWhenOrElseArgs().joinArgs().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrElse<R extends Object?>(item..., required orElse) {...}
  @nonVirtual
  String topMatchWhenOrElse() => [
        topMatchWhenOrElseStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrElse(),
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();
}
