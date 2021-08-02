import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer partialWhen()
@sealed
@immutable
class TopMatchPartialWhenWriter extends TopMatchBaseWriter {
  const TopMatchPartialWhenWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { sunny?.call(weather); }
  If topMatchPartialWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          '${subLower(item)}?.call',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchPartialWhenIfs() =>
      manifest.items.map(topMatchPartialWhenIf).toList();

  /// body of when method
  String topMatchPartialWhenBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchPartialWhenIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchPartialWhenArgs() =>
      manifest.items.map(topMatchVoidNArg);

  /// start of when method
  String topMatchPartialWhenStart() => [
        'void partialWhen',
        topMatchPartialWhenArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void PartialWhen(item...)
  /// {...}
  String topMatchPartialWhen() => [
        topMatchPartialWhenStart(),
        '{',
        topMatchPartialWhenBody(),
        '}',
      ].joinLines();
}
