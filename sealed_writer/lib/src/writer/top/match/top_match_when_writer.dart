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
  @nonVirtual
  @visibleForTesting
  If topMatchWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchWhenIfs() => manifest.items.map(topMatchWhenIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchWhenArgs() =>
      manifest.items.map(topMatchGenericNNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        topMatchWhenArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R when<R extends Object?>(required item...)
  /// {...}
  @nonVirtual
  String topMatchWhen() => [
        topMatchWhenStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchWhenBody(),
        '}',
      ].joinLines();
}
