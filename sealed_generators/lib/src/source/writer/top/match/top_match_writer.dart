import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_default_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_null_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_throw_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_writer.dart';

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
        super(source);

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenWriter topMatchWhenWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenOrElseWriter topMatchWhenOrElseWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenOrDefaultWriter topMatchWhenOrDefaultWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenOrNullWriter topMatchWhenOrNullWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenOrThrowWriter topMatchWhenOrThrowWriter;

  @nonVirtual
  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchWhenOrElseWriter.topMatchWhenOrElse(),
        topMatchWhenOrDefaultWriter.topMatchWhenOrDefault(),
        topMatchWhenOrNullWriter.topMatchWhenOrNull(),
        topMatchWhenOrThrowWriter.topMatchWhenOrThrow(),
      ];
}
