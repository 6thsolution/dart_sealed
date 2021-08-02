import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_maybe_when_writer.dart';
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
        super(manifest);

  final TopMatchWhenWriter topMatchWhenWriter;

  final TopMatchMaybeWhenWriter topMatchMaybeWhenWriter;

  final TopMatchPartialWhenWriter topMatchPartialWhenWriter;

  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchMaybeWhenWriter.topMatchMaybeWhen(),
        topMatchPartialWhenWriter.topMatchPartialWhen(),
      ];
}
