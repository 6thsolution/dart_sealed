import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/reader/source_reader.dart';
import 'package:source_gen/source_gen.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  const SealedGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final source = SourceReader.read(element, annotation);
    return source.generate();
  }

  @override
  String toString() => 'sealed_generators';
}
