import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';

/// match method writer whenOrNull()
class TopMatchWhenOrNullWriter extends TopMatchBaseWriter {
  const TopMatchWhenOrNullWriter(Manifest manifest) : super(manifest);

  /// ex. if (weather is WeatherSunny) { return (sunny ?? orElse)(weather); }
  If topMatchWhenOrNullIf(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: [
          'return ${subLower(item)} != null ?',
          ' ${subLower(item)}',
          topMatchWrappedItemCallArgs(item),
          ' : orElse?.call',
          topMatchItemCallArgs(),
          ';',
        ].joinParts(),
      );

  List<If> topMatchWhenOrNullIfs() =>
      manifest.items.map(topMatchWhenOrNullIf).toList();

  /// body of when method
  String topMatchWhenOrNullBody() => [
        initThisValue(),
        Branch(
          ifs: topMatchWhenOrNullIfs(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  Iterable<String> topMatchWhenOrNullItemArgs() =>
      manifest.items.map(topMatchWrappedGenericNArg);

  Iterable<String> topMatchWhenOrNullArgs() => [
        ...topMatchWhenOrNullItemArgs(),
        topMatchGenericNArgOrElse(),
      ];

  /// start of when method
  String topMatchWhenOrNullStart() => [
        'R? whenOrNull$topMatchParam',
        topMatchWhenOrNullArgs().joinArgsFull().withBraces().withParenthesis(),
      ].joinParts();

  /// R? whenOrNull<R extends Object?>(item..., orElse) {...}
  String topMatchWhenOrNull() => [
        topMatchWhenOrNullStart(),
        '{',
        topMatchWhenOrNullBody(),
        '}',
      ].joinLines();
}
