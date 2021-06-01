import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer when()
@sealed
@immutable
class TopMatchWhenWriter extends TopMatchBaseWriter {
  const TopMatchWhenWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  If topMatchWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)}',
          topMatchNonOrWrappedItemCallArgs(item),
          ';',
        ].joinParts(),
      );

  List<If> topMatchWhenIfs() => manifest.items.map(topMatchWhenIf).toList();

  /// body of when method
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenArgs() =>
      manifest.items.map(topMatchNonOrWrappedGenericNNArg);

  /// start of when method
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        topMatchWhenArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R when<R extends Object?>(required item...)
  /// {...}
  String topMatchWhen() => [
        topMatchWhenStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchWhenBody(),
        '}',
      ].joinLines();
}
