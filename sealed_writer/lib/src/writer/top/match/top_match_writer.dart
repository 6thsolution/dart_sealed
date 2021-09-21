import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_map_or_null_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_maybe_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_maybe_when_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_partial_map_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_partial_when_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_null_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';

/// match method writer
class TopMatchWriter extends BaseWriter {
  TopMatchWriter(Manifest manifest)
      : topMatchWhenWriter = TopMatchWhenWriter(manifest),
        topMatchMaybeWhenWriter = TopMatchMaybeWhenWriter(manifest),
        topMatchPartialWhenWriter = TopMatchPartialWhenWriter(manifest),
        topMatchWhenOrNullWriter = TopMatchWhenOrNullWriter(manifest),
        topMatchMapWriter = TopMatchMapWriter(manifest),
        topMatchMaybeMapWriter = TopMatchMaybeMapWriter(manifest),
        topMatchPartialMapWriter = TopMatchPartialMapWriter(manifest),
        topMatchMapOrNullWriter = TopMatchMapOrNullWriter(manifest),
        super(manifest);

  final TopMatchWhenWriter topMatchWhenWriter;

  final TopMatchMaybeWhenWriter topMatchMaybeWhenWriter;

  final TopMatchPartialWhenWriter topMatchPartialWhenWriter;

  final TopMatchWhenOrNullWriter topMatchWhenOrNullWriter;

  final TopMatchMapWriter topMatchMapWriter;

  final TopMatchMaybeMapWriter topMatchMaybeMapWriter;

  final TopMatchPartialMapWriter topMatchPartialMapWriter;

  final TopMatchMapOrNullWriter topMatchMapOrNullWriter;

  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchMaybeWhenWriter.topMatchMaybeWhen(),
        topMatchPartialWhenWriter.topMatchPartialWhen(),
        topMatchWhenOrNullWriter.topMatchWhenOrNull(),
        topMatchMapWriter.topMatchMap(),
        topMatchMaybeMapWriter.topMatchMaybeMap(),
        topMatchPartialMapWriter.topMatchPartialMap(),
        topMatchMapOrNullWriter.topMatchMapOrNull(),
      ];
}
