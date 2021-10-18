import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_writer.dart';
import 'package:sealed_writer/src/writer/top/top_builder_writer.dart';
import 'package:sealed_writer/src/writer/top/top_cast_writer.dart';
import 'package:sealed_writer/src/writer/top/top_common_writer.dart';
import 'package:sealed_writer/src/writer/top/top_doc_writer.dart';

/// source writer
class TopWriter extends BaseUtilsWriter {
  /// [referToManifest] dictates weather to reference
  /// manifest with @SealedManifest or not, it is true by default
  TopWriter(
    Manifest manifest, {
    this.referToManifest = true,
  })  : topBuilderWriter = TopBuilderWriter(manifest),
        topCastWriter = TopCastWriter(manifest),
        topMatchWriter = TopMatchWriter(manifest),
        topDocWriter = TopDocWriter(manifest),
        topCommonWriter = TopCommonWriter(manifest),
        super(manifest);

  final bool referToManifest;

  final TopBuilderWriter topBuilderWriter;

  final TopCastWriter topCastWriter;

  final TopMatchWriter topMatchWriter;

  final TopDocWriter topDocWriter;

  final TopCommonWriter topCommonWriter;

  /// ex. @SealedManifest(_Weather)
  String topManifest() => '@SealedManifest(_$top)';

  String topConstructor() => 'const $top._internal();';

  Iterable<String> topMethods() => [
        ...topCommonWriter.topCommonGetters(),
        ...topBuilderWriter.topBuilderMethods(),
        ...topCastWriter.topCastMethods(),
        ...topMatchWriter.topMatchMethods(),
      ];

  String topClassStart() => [
        topDocWriter.write(),
        if (referToManifest) topManifest(),
        'abstract class $topDec',
      ].joinLines();

  String topClass() => [
        topClassStart(),
        '{',
        topConstructor(),
        ...topMethods(),
        '}',
      ].joinMethods();
}
