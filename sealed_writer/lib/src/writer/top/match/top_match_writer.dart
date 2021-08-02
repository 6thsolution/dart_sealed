import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_partial_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';

/// match method writer
@sealed
@immutable
class TopMatchWriter extends BaseWriter {
  TopMatchWriter(Manifest manifest)
      : topMatchWhenWriter = TopMatchWhenWriter(manifest),
        topMatchWhenOrElseWriter = TopMatchWhenOrElseWriter(manifest),
        topMatchWhenPartialWriter = TopMatchWhenPartialWriter(manifest),
        super(manifest);

  final TopMatchWhenWriter topMatchWhenWriter;

  final TopMatchWhenOrElseWriter topMatchWhenOrElseWriter;

  final TopMatchWhenPartialWriter topMatchWhenPartialWriter;

  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchWhenOrElseWriter.topMatchWhenOrElse(),
        topMatchWhenPartialWriter.topMatchWhenPartial(),
      ];
}
