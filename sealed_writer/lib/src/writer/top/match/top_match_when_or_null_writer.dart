import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrNull()
@sealed
@immutable
class TopMatchWhenOrNullWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrNullWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) {
  /// return sunny != null ? sunny(weather) : null;
  /// }
  If topMatchWhenOrNullIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}?.call($topLower);',
      );

  List<If> topMatchWhenOrNullIfs() =>
      manifest.items.map(topMatchWhenOrNullIf).toList();

  /// body of when method
  String topMatchWhenOrNullBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrNullIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenOrNullArgs() =>
      manifest.items.map(topMatchGenericNArg);

  /// start of when method
  String topMatchWhenOrNullStart() => [
        'R$n whenOrNull$topMatchParam',
        topMatchWhenOrNullArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R? whenOrNull<R extends Object?>(item...) {...}
  String topMatchWhenOrNull() => [
        topMatchWhenOrNullStart(),
        '{',
        topMatchWhenOrNullBody(),
        '}',
      ].joinLines();
}
