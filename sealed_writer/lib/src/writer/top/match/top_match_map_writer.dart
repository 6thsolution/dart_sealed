import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer map()
class TopMatchMapWriter extends TopMatchBaseWriter {
  const TopMatchMapWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  If topMatchMapIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)}',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchMapIfs() => manifest.items.map(topMatchMapIf).toList();

  /// body of map method
  String topMatchMapBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchMapIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchMapArgs() =>
      manifest.items.map(topMatchGenericNNArg);

  /// start of map method
  String topMatchMapStart() => [
        'R map$topMatchParam',
        topMatchMapArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R map<R extends Object?>(required item...)
  /// {...}
  String topMatchMap() => [
        topMatchMapStart(),
        '{',
        topMatchMapBody(),
        '}',
      ].joinLines();
}
