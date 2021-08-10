import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer when()
class TopMatchWhenWriter extends TopMatchBaseWriter {
  const TopMatchWhenWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  If topMatchWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)}',
          topMatchWrappedItemCallArgs(item),
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
      manifest.items.map(topMatchWrappedGenericNNArg);

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
        topMatchWhenBody(),
        '}',
      ].joinLines();
}
