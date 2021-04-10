import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_or_else_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_when_writer.dart';

/// source writer
@sealed
@immutable
class TopMatchWriter extends BaseWriter {
  TopMatchWriter(Source source)
      : topMatchWhenWriter = TopMatchWhenWriter(source),
        topMatchWhenOrElseWriter = TopMatchWhenOrElseWriter(source),
        super(source);

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenWriter topMatchWhenWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWhenOrElseWriter topMatchWhenOrElseWriter;

  @nonVirtual
  Iterable<String> topMatchMethods() => [
        topMatchWhenWriter.topMatchWhen(),
        topMatchWhenOrElseWriter.topMatchWhenOrElse(),
      ];
}
