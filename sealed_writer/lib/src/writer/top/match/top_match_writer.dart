import 'package:meta/meta.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_default_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_null_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_or_throw_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_partial_writer.dart';
import 'package:sealed_writer/src/writer/top/match/top_match_when_writer.dart';

/// match method writer
@sealed
@immutable
class TopMatchWriter extends BaseWriter {
  TopMatchWriter(Source source)
      : topMatchWhenWriter = TopMatchWhenWriter(source),
        topMatchWhenOrElseWriter = TopMatchWhenOrElseWriter(source),
        topMatchWhenOrDefaultWriter = TopMatchWhenOrDefaultWriter(source),
        topMatchWhenOrNullWriter = TopMatchWhenOrNullWriter(source),
        topMatchWhenOrThrowWriter = TopMatchWhenOrThrowWriter(source),
        topMatchWhenPartialWriter = TopMatchWhenPartialWriter(source),
        super(source);

  final TopMatchWhenWriter topMatchWhenWriter;

  final TopMatchWhenOrElseWriter topMatchWhenOrElseWriter;

  final TopMatchWhenOrDefaultWriter topMatchWhenOrDefaultWriter;

  final TopMatchWhenOrNullWriter topMatchWhenOrNullWriter;

  final TopMatchWhenOrThrowWriter topMatchWhenOrThrowWriter;

  final TopMatchWhenPartialWriter topMatchWhenPartialWriter;

  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchWhenOrElseWriter.topMatchWhenOrElse(),
        topMatchWhenOrDefaultWriter.topMatchWhenOrDefault(),
        topMatchWhenOrNullWriter.topMatchWhenOrNull(),
        topMatchWhenOrThrowWriter.topMatchWhenOrThrow(),
        topMatchWhenPartialWriter.topMatchWhenPartial(),
      ];
}
