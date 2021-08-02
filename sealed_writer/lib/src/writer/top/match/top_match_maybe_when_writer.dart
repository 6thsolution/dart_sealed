import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer maybeWhen()
@sealed
@immutable
class TopMatchMaybeWhenWriter extends TopMatchBaseWriter {
  const TopMatchMaybeWhenWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchMaybeWhenIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchWrappedItemCallArgs(item),
          ' : orElse',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchMaybeWhenIfs() =>
      manifest.items.map(topMatchMaybeWhenIf).toList();

  /// body of when method
  String topMatchMaybeWhenBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchMaybeWhenIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchMaybeWhenItemArgs() =>
      manifest.items.map(topMatchWrappedGenericNArg);

  Iterable<String> topMatchMaybeWhenArgs() => [
        ...topMatchMaybeWhenItemArgs(),
        topMatchGenericNNArgOrElse(),
      ];

  /// start of when method
  String topMatchMaybeWhenStart() => [
        'R maybeWhen$topMatchParam',
        topMatchMaybeWhenArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R maybeWhen<R extends Object?>(item..., required orElse) {...}
  String topMatchMaybeWhen() => [
        topMatchMaybeWhenStart(),
        '{',
        topMatchMaybeWhenBody(),
        '}',
      ].joinLines();
}
