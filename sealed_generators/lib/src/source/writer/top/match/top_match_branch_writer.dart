import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer when()
@sealed
@immutable
class TopMatchBranchWriter extends TopMatchBaseWriter {
  const TopMatchBranchWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { sunny(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchBranchIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: '${subLower(item)}($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchBranchIfs() => manifest.items.map(topMatchBranchIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchBranchIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchBranchArgs() =>
      manifest.items.map(topMatchVoidNNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchStart() => [
        'void branch',
        topMatchBranchArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void branch(required item...)
  /// {...}
  @nonVirtual
  String topMatchBranch() => [
        topMatchBranchStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchBranchBody(),
        '}',
      ].joinLines();
}
