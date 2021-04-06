import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_cast_utils_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class TopMatchWriter extends BaseCastUtilsWriter {
  const TopMatchWriter(Source source) : super(source);

  /// <R extends Object?>
  @protected
  @nonVirtual
  @visibleForTesting
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArg(ManifestItem item) => '$req R Function'
      '(${subFull(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (R Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArgOrElse() => '$req R Function'
      '($top$nn $topLower)$nn orElse';

  /// (R Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNArg(ManifestItem item) => 'R Function'
      '(${subFull(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// required (void Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArg(ManifestItem item) => '$req void Function'
      '(${subFull(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (void Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArgOrElse() => '$req void Function'
      '($top$nn $topLower)$nn orElse';

  /// (void Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNArg(ManifestItem item) => 'void Function'
      '(${subFull(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// assert(sunny != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssert(ManifestItem item) =>
      'assert(${subLower(item)} != null);';

  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAsserts() => manifest.items.map(topMatchAssert).joinLines();

  /// assert(orElse != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssertOrElse() => 'assert(orElse != null);';

  /// ex. throw AssertionError();
  @protected
  @nonVirtual
  @visibleForTesting
  String throwAssertion() => 'throw AssertionError();';

  /// else clause with throw
  @protected
  @nonVirtual
  @visibleForTesting
  Else throwingElse() => Else(
        code: throwAssertion(),
      );

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
