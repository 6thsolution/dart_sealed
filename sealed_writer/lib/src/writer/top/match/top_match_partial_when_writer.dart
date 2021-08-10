import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer partialWhen()
class TopMatchPartialWhenWriter extends TopMatchBaseWriter {
  const TopMatchPartialWhenWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { sunny?.call(weather); }
  If topMatchPartialWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: Branch(
          ifs: [
            If(
              condition: '${subLower(item)} != null',
              code: '${subLower(item)}${topMatchWrappedItemCallArgs(item)};',
            ),
            If(
              condition: 'orElse != null',
              code: 'orElse${topMatchItemCallArgs()};',
            ),
          ],
        ).join(),
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

  Iterable<String> topMatchPartialWhenArgs() => [
        ...manifest.items.map(topMatchWrappedVoidNArg),
        topMatchVoidNArgOrElse(),
      ];

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
