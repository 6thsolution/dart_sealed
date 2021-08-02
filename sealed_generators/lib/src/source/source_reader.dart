import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_generators/src/manifest/manifest_reader_builder.dart';
import 'package:sealed_generators/src/options/null_safety.dart';
import 'package:sealed_writer/sealed_writer.dart';

class SourceReader {
  const SourceReader();

  /// read manifest from element
  Manifest read(Element element) {
    const NullSafety().checkIsNullSafe(element);
    return const ManifestReaderBuilder().build(element).read();
  }
}
