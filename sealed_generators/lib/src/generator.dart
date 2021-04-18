import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/source/reader/source_reader.dart';
import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:source_gen/source_gen.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  const SealedGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    try {
      return SourceWriter(
        const SourceReader().read(element, annotation),
      ).write();
    } on SealedException {
      rethrow;
    } catch (e) {
      throw SealedException('internal error', e);
    }
  }

  @override
  String toString() => 'sealed_generators';
}
