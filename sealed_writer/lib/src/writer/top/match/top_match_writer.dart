import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_maybe_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_maybe_when_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_partial_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_partial_when_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';

/// match method writer
@sealed
@immutable
class TopMatchWriter extends BaseWriter {
  TopMatchWriter(Manifest manifest)
      : topMatchWhenWriter = TopMatchWhenWriter(manifest),
        topMatchMaybeWhenWriter = TopMatchMaybeWhenWriter(manifest),
        topMatchPartialWhenWriter = TopMatchPartialWhenWriter(manifest),
        topMatchMapWriter = TopMatchMapWriter(manifest),
        topMatchMaybeMapWriter = TopMatchMaybeMapWriter(manifest),
        topMatchPartialMapWriter = TopMatchPartialMapWriter(manifest),
        super(manifest);

  final TopMatchWhenWriter topMatchWhenWriter;

  final TopMatchMaybeWhenWriter topMatchMaybeWhenWriter;

  final TopMatchPartialWhenWriter topMatchPartialWhenWriter;

  final TopMatchMapWriter topMatchMapWriter;

  final TopMatchMaybeMapWriter topMatchMaybeMapWriter;

  final TopMatchPartialMapWriter topMatchPartialMapWriter;

  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchMaybeWhenWriter.topMatchMaybeWhen(),
        topMatchPartialWhenWriter.topMatchPartialWhen(),
        topMatchMapWriter.topMatchMap(),
        topMatchMaybeMapWriter.topMatchMaybeMap(),
        topMatchPartialMapWriter.topMatchPartialMap(),
      ];
}
