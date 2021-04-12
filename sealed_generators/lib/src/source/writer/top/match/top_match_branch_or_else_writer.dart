import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_base_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// match method writer whenOrElse()
@sealed
@immutable
class TopMatchBranchOrElseWriter extends TopMatchBaseWriter {
  const TopMatchBranchOrElseWriter(Source source) : super(source);

  /// ex. if (weather is WeatherSunny) { (sunny ?? orElse)(weather); }
  @nonVirtual
  @visibleForTesting
  If topMatchBranchOrElseIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: '(${subLower(item)} ?? orElse)($topLower);',
      );

  @nonVirtual
  @visibleForTesting
  List<If> topMatchBranchOrElseIfs() =>
      manifest.items.map(topMatchBranchOrElseIf).toList();

  /// body of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchBranchOrElseIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchBranchOrElseItemArgs() =>
      manifest.items.map(topMatchVoidNArg);

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchBranchOrElseArgs() => [
        ...topMatchBranchOrElseItemArgs(),
        topMatchVoidNNArgOrElse(),
      ];

  /// start of when method
  @nonVirtual
  @visibleForTesting
  String topMatchBranchOrElseStart() => [
        'void branchOrElse',
        topMatchBranchOrElseArgs()
            .joinArgsFull()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// void branchOrElse(item..., required orElse) {...}
  @nonVirtual
  String topMatchBranchOrElse() => [
        topMatchBranchOrElseStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrElse(),
        topMatchBranchOrElseBody(),
        '}',
      ].joinLines();
}
