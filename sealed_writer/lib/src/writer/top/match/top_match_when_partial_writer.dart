import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenPartial()
@sealed
@immutable
class TopMatchWhenPartialWriter extends TopMatchBaseWriter {
  const TopMatchWhenPartialWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { sunny?.call(weather); }
  If topMatchWhenPartialIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          '${subLower(item)}?.call',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchWhenPartialIfs() =>
      manifest.items.map(topMatchWhenPartialIf).toList();

  /// body of when method
  String topMatchWhenPartialBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenPartialIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenPartialArgs() =>
      manifest.items.map(topMatchVoidNArg);

  /// start of when method
  String topMatchWhenPartialStart() => [
        'void whenPartial',
        topMatchWhenPartialArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void WhenPartial(item...)
  /// {...}
  String topMatchWhenPartial() => [
        topMatchWhenPartialStart(),
        '{',
        topMatchWhenPartialBody(),
        '}',
      ].joinLines();
}
