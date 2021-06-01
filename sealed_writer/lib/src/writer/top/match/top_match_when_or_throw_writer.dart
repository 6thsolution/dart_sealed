import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrThrow()
@sealed
@immutable
class TopMatchWhenOrThrowWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrThrowWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny && sunny != null) {
  /// return sunny(weather);
  /// }
  If topMatchWhenOrThrowIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)} && ${subLower(item)} != null',
        code: [
          'return ${subLower(item)}',
          topMatchNonOrWrappedItemCallArgs(item),
          ';',
        ].joinParts(),
      );

  List<If> topMatchWhenOrThrowIfs() =>
      manifest.items.map(topMatchWhenOrThrowIf).toList();

  /// body of when method
  String topMatchWhenOrThrowBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrThrowIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenOrThrowArgs() =>
      manifest.items.map(topMatchNonOrWrappedGenericNArg);

  /// start of when method
  String topMatchWhenOrThrowStart() => [
        'R whenOrThrow$topMatchParam',
        topMatchWhenOrThrowArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrThrow<R extends Object?>(item...) {...}
  String topMatchWhenOrThrow() => [
        topMatchWhenOrThrowStart(),
        '{',
        topMatchWhenOrThrowBody(),
        '}',
      ].joinLines();
}
