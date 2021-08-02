import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:sealed_writer/src/writer/sub/sub_writer.dart';
import 'package:sealed_writer/src/writer/top/top_writer.dart';

/// source writer
///
/// NOTE: writer phase is completely disjoint from reader phase.
@sealed
@immutable
class SourceWriter extends BaseWriter {
  /// [referenceManifest] dictates weather to reference
  /// manifest with @SealedManifest or not, it is true by default
  SourceWriter(Manifest manifest)
      : topWriter = TopWriter(manifest),
        subWriter = SubWriter(manifest),
        super(manifest);

  final TopWriter topWriter;

  final SubWriter subWriter;

  Iterable<String> classes() => [
        topWriter.topClass(),
        ...subWriter.subClasses(),
      ];

  String write() => classes().joinMethods();
}
