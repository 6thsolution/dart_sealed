import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer mapOrNull()
class TopMatchMapOrNullWriter extends TopMatchBaseWriter {
  const TopMatchMapOrNullWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchMapOrNullIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchItemCallArgs(),
          ' : orElse?.call',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchMapOrNullIfs() =>
      manifest.items.map(topMatchMapOrNullIf).toList();

  /// body of map method
  String topMatchMapOrNullBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchMapOrNullIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchMapOrNullItemArgs() =>
      manifest.items.map(topMatchGenericNArg);

  Iterable<String> topMatchMapOrNullArgs() => [
        ...topMatchMapOrNullItemArgs(),
        topMatchGenericNArgOrElse(),
      ];

  /// start of map method
  String topMatchMapOrNullStart() => [
        'R? mapOrNull$topMatchParam',
        topMatchMapOrNullArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R? mapOrNull<R extends Object?>(item..., orElse) {...}
  String topMatchMapOrNull() => [
        topMatchMapOrNullStart(),
        '{',
        topMatchMapOrNullBody(),
        '}',
      ].joinLines();
}
