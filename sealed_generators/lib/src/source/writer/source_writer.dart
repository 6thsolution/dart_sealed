import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/source/writer/sub/sub_writer.dart';
import 'package:sealed_generators/src/source/writer/top/top_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SourceWriter extends BaseWriter {
  SourceWriter(Source source)
      : topWriter = TopWriter(source),
        subWriter = SubWriter(source),
        super(source);

  @nonVirtual
  @visibleForTesting
  final TopWriter topWriter;

  @nonVirtual
  @visibleForTesting
  final SubWriter subWriter;

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> classes() => [
        topWriter.topClass(),
        ...subWriter.subClasses(),
      ];

  @nonVirtual
  String write() => classes().joinMethods();
}
