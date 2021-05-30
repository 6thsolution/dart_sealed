import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest_reader_builder.dart';
import 'package:sealed_generators/src/options/options_reader.dart';
import 'package:sealed_writer/sealed_writer.dart';

/// source reader
@sealed
@immutable
class SourceReader {
  const SourceReader();

  /// read source
  Source read(Element element) {
    final options = const OptionsReader().read(element);
    return Source(
      options: options,
      manifest: ManifestReaderBuilder(options: options).build(element).read(),
    );
  }
}
