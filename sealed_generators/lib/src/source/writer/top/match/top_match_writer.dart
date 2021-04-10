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
class TopMatchWriter extends TopMatchBaseWriter {
  const TopMatchWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @protected
  @nonVirtual
  @visibleForTesting
  If topMatchWhenIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}($topLower);',
      );

  /// body of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: manifest.items.map(topMatchWhenIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        manifest.items
            .map(topMatchGenericNNArg)
            .joinArgs()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// R when<R extends Object?>(required item...)
  /// {...}
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhen() => [
        topMatchWhenStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchWhenBody(),
        '}',
      ].joinLines();

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @protected
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrElseIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return (${subLower(item)} ?? orElse)($topLower);',
      );

  /// body of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: manifest.items.map(topMatchWhenOrElseIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseStart() => [
        'R whenOrElse$topMatchParam',
        [
          ...manifest.items.map(topMatchGenericNArg),
          topMatchGenericNNArgOrElse(),
        ].joinArgs().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrElse<R extends Object?>(item..., required orElse) {...}
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElse() => [
        topMatchWhenOrElseStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrElse(),
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();

  @nonVirtual
  Iterable<String> topMatchMethods() => [
        topMatchWhen(),
        topMatchWhenOrElse(),
      ];
}
