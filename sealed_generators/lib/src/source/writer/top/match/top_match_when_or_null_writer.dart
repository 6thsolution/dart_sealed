import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer whenOrNull()
@sealed
@immutable
class TopMatchWhenOrNullWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrNullWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) {
  /// return sunny != null ? sunny(weather) : null;
  /// }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrNullIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}?.call($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenOrNullIfs() =>
      manifest.items.map(topMatchWhenOrNullIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrNullBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrNullIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenOrNullArgs() =>
      manifest.items.map(topMatchGenericNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrNullStart() => [
        'R$n whenOrNull$topMatchParam',
        topMatchWhenOrNullArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R? whenOrNull<R extends Object?>(item...) {...}
  @nonVirtual
  String topMatchWhenOrNull() => [
        topMatchWhenOrNullStart(),
        '{',
        topMatchWhenOrNullBody(),
        '}',
      ].joinLines();
}
