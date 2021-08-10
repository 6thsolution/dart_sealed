import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer maybeMap()
class TopMatchMaybeMapWriter extends TopMatchBaseWriter {
  const TopMatchMaybeMapWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchMaybeMapIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchItemCallArgs(),
          ' : orElse',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchMaybeMapIfs() =>
      manifest.items.map(topMatchMaybeMapIf).toList();

  /// body of map method
  String topMatchMaybeMapBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchMaybeMapIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchMaybeMapItemArgs() =>
      manifest.items.map(topMatchGenericNArg);

  Iterable<String> topMatchMaybeMapArgs() => [
        ...topMatchMaybeMapItemArgs(),
        topMatchGenericNNArgOrElse(),
      ];

  /// start of map method
  String topMatchMaybeMapStart() => [
        'R maybeMap$topMatchParam',
        topMatchMaybeMapArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R maybeMap<R extends Object?>(item..., required orElse) {...}
  String topMatchMaybeMap() => [
        topMatchMaybeMapStart(),
        '{',
        topMatchMaybeMapBody(),
        '}',
      ].joinLines();
}
