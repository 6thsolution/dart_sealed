import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer branchOrThrow()
@sealed
@immutable
class TopMatchBranchOrThrowWriter extends TopMatchBaseWriter {
  const TopMatchBranchOrThrowWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny && sunny != null) {
  /// sunny(weather);
  /// }
  @nonVirtual
  @visibleForTesting
  If topMatchBranchOrThrowIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)} && ${subLower(item)} != null',
        code: '${subLower(item)}($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchBranchOrThrowIfs() =>
      manifest.items.map(topMatchBranchOrThrowIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchOrThrowBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchBranchOrThrowIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchBranchOrThrowArgs() =>
      manifest.items.map(topMatchVoidNArg);

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchOrThrowStart() => [
        'void branchOrThrow',
        topMatchBranchOrThrowArgs()
            .joinArgsFull()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// void branchOrThrow(item...) {...}
  @nonVirtual
  String topMatchBranchOrThrow() => [
        topMatchBranchOrThrowStart(),
        '{',
        topMatchBranchOrThrowBody(),
        '}',
      ].joinLines();
}
