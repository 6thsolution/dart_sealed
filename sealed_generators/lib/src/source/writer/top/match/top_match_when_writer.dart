import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class TopMatchWhenWriter extends TopMatchBaseWriter {
  const TopMatchWhenWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchWhenIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}($topLower);',
      );

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: manifest.items.map(topMatchWhenIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        manifest.items
            .map(topMatchGenericNNArg)
            .joinArgs()
            .withBraces()
            .withParenthesis(),
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
