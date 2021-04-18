import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/reader/manifest_reader_builder.dart';
import 'package:sealed_generators/src/options/reader/options_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:source_gen/src/constants/reader.dart';

/// todo test read
@sealed
@immutable
class SourceReader {
  const SourceReader();

  Source read(
    Element element,
    ConstantReader annotation,
  ) {
    final options = const OptionsReader().read(element, annotation);
    final manifest = ManifestReaderBuilder(options: options)
        .build(element, annotation)
        .read();
    return Source(options: options, manifest: manifest);
  }
}
