import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrDefault()
@sealed
@immutable
class TopMatchWhenOrDefaultWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrDefaultWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) {
  /// return sunny != null ? sunny(weather) : orDefault;
  /// }
  If topMatchWhenOrDefaultIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchNonOrWrappedItemCallArgs(item),
          ' : orDefault;',
        ].joinParts(),
      );

  List<If> topMatchWhenOrDefaultIfs() =>
      manifest.items.map(topMatchWhenOrDefaultIf).toList();

  /// body of when method
  String topMatchWhenOrDefaultBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrDefaultIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenOrDefaultItemArgs() =>
      manifest.items.map(topMatchNonOrWrappedGenericNArg);

  Iterable<String> topMatchWhenOrDefaultArgs() => [
        ...topMatchWhenOrDefaultItemArgs(),
        topMatchGenericNNArgOrDefault(),
      ];

  /// start of when method
  String topMatchWhenOrDefaultStart() => [
        'R whenOrDefault$topMatchParam',
        topMatchWhenOrDefaultArgs()
            .joinArgsFull()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// R whenOrDefault<R extends Object?>(item..., required orDefault) {...}
  String topMatchWhenOrDefault() => [
        topMatchWhenOrDefaultStart(),
        '{',
        topMatchWhenOrDefaultBody(),
        '}',
      ].joinLines();
}
