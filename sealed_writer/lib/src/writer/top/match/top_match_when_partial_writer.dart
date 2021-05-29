import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenPartial()
@sealed
@immutable
class TopMatchWhenPartialWriter extends TopMatchBaseWriter {
  const TopMatchWhenPartialWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { sunny?.call(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenPartialIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: '${subLower(item)}?.call($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenPartialIfs() =>
      manifest.items.map(topMatchWhenPartialIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenPartialBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenPartialIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenPartialArgs() =>
      manifest.items.map(topMatchVoidNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenPartialStart() => [
        'void whenPartial',
        topMatchWhenPartialArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void WhenPartial(item...)
  /// {...}
  @nonVirtual
  String topMatchWhenPartial() => [
        topMatchWhenPartialStart(),
        '{',
        topMatchWhenPartialBody(),
        '}',
      ].joinLines();
}
