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
class TopMatchBranchPartialWriter extends TopMatchBaseWriter {
  const TopMatchBranchPartialWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { sunny(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchBranchPartialIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: '${subLower(item)}?.call($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchBranchPartialIfs() => manifest.items.map(topMatchBranchPartialIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchPartialBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchBranchPartialIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchBranchPartialArgs() =>
      manifest.items.map(topMatchVoidNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchPartialStart() => [
        'void branchPartial',
        topMatchBranchPartialArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// void branchPartial(item...)
  /// {...}
  @nonVirtual
  String topMatchBranchPartial() => [
        topMatchBranchPartialStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchBranchPartialBody(),
        '}',
      ].joinLines();
}
