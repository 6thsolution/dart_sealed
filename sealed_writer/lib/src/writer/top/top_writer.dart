import 'package:meta/meta.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_writer.dart';
import 'package:sealed_writer/src/writer/top/top_builder_writer.dart';
import 'package:sealed_writer/src/writer/top/top_cast_writer.dart';
import 'package:sealed_writer/src/writer/top/top_doc_writer.dart';

/// source writer
@sealed
@immutable
class TopWriter extends BaseUtilsWriter {
  TopWriter(Source source)
      : topBuilderWriter = TopBuilderWriter(source),
        topCastWriter = TopCastWriter(source),
        topMatchWriter = TopMatchWriter(source),
        topDocWriter = TopDocWriter(source),
        super(source);

  final TopBuilderWriter topBuilderWriter;

  final TopCastWriter topCastWriter;

  final TopMatchWriter topMatchWriter;

  final TopDocWriter topDocWriter;

  /// ex. @SealedManifest(_Weather)
  String topManifest() => '@SealedManifest(_$top)';

  String topConstructor() => 'const $top._internal();';

  Iterable<String> topMethods() => [
        ...topBuilderWriter.topBuilderMethods(),
        ...topCastWriter.topCastMethods(),
        ...topMatchWriter.topMatchMethods(),
      ];

  String topClassStart() => [
        topDocWriter.write(),
        annotationImmutable,
        topManifest(),
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
