import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrElse()
@sealed
@immutable
class TopMatchWhenOrElseWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrElseWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchWhenOrElseIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)} != null ?'
            ' ${subLower(item)}($topLower) : orElse($topLower);',
      );

  List<If> topMatchWhenOrElseIfs() =>
      manifest.items.map(topMatchWhenOrElseIf).toList();

  /// body of when method
  String topMatchWhenOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrElseIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenOrElseItemArgs() =>
      manifest.items.map(topMatchGenericNArg);

  Iterable<String> topMatchWhenOrElseArgs() => [
        ...topMatchWhenOrElseItemArgs(),
        topMatchGenericNNArgOrElse(),
      ];

  /// start of when method
  String topMatchWhenOrElseStart() => [
        'R whenOrElse$topMatchParam',
        topMatchWhenOrElseArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrElse<R extends Object?>(item..., required orElse) {...}
  String topMatchWhenOrElse() => [
        topMatchWhenOrElseStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrElse(),
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();
}
