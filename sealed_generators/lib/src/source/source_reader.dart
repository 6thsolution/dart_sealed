import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest_reader_builder.dart';
import 'package:sealed_generators/src/options/options_reader.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:source_gen/src/constants/reader.dart';

/// source reader
@sealed
@immutable
class SourceReader {
  const SourceReader();

  /// read source
  Source read(
    Element element,
    ConstantReader annotation,
  ) {
    final options = const OptionsReader().read(element, annotation);
    return Source(
      options: options,
      manifest: ManifestReaderBuilder(options: options)
          .build(element, annotation)
          .read(),
    );
  }
}