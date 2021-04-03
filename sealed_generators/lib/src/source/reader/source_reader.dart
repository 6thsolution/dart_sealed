import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_generators/src/manifest/reader/manifest_reader.dart';
import 'package:sealed_generators/src/options/reader/options_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:source_gen/src/constants/reader.dart';

class SourceReader {
  SourceReader._() {
    throw AssertionError();
  }

  static Source read(Element element, ConstantReader annotation) {
    return Source(
      options: OptionsReader.read(element, annotation),
      manifest: ManifestReader.read(element),
    );
  }
}
