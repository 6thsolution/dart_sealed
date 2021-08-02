import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrElse()
@sealed
@immutable
class TopMatchWhenOrElseWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrElseWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchWhenOrElseIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchNonOrWrappedItemCallArgs(item),
          ' : orElse',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
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
      manifest.items.map(topMatchNonOrWrappedGenericNArg);

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
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();
}
