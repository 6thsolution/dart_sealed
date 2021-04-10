import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/source/writer/top/match/top_match_writer.dart';
import 'package:sealed_generators/src/source/writer/top/top_builder_writer.dart';
import 'package:sealed_generators/src/source/writer/top/top_cast_writer.dart';
import 'package:sealed_generators/src/source/writer/top/top_doc_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

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

  @nonVirtual
  @visibleForTesting
  final TopBuilderWriter topBuilderWriter;

  @nonVirtual
  @visibleForTesting
  final TopCastWriter topCastWriter;

  @nonVirtual
  @visibleForTesting
  final TopMatchWriter topMatchWriter;

  @nonVirtual
  @visibleForTesting
  final TopDocWriter topDocWriter;

  /// ex. @SealedManifest(_Weather)

  @nonVirtual
  @visibleForTesting
  String topManifest() => '@SealedManifest(_$top)';

  /// bool operator ==(Object other) => false;

  @nonVirtual
  @visibleForTesting
  String topDistinctEquality() => [
        annotationOverride,
        'bool$nn operator ==(Object other) => false;',
      ].joinLines();

  @nonVirtual
  @visibleForTesting
  Iterable<String> topMethods() => [
        ...topBuilderWriter.topBuilderMethods(),
        ...topCastWriter.topCastMethods(),
        ...topMatchWriter.topMatchMethods(),
        if (options.equality == SealedEquality.distinct) topDistinctEquality(),
      ];

  @nonVirtual
  @visibleForTesting
  String topClassStart() => [
        topDocWriter.write(),
        topManifest(),
        [
          'abstract class $top',
          if (options.equality == SealedEquality.data) ' extends Equatable',
        ].joinParts()
      ].joinLines();

  @nonVirtual
  String topClass() => [
        topClassStart(),
        '{',
        ...topMethods(),
        '}',
      ].joinMethods();
}
