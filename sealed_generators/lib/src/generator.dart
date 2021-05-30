import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source_reader.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:source_gen/source_gen.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  const SealedGenerator();

  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader _, BuildStep __) {
    final source = const SourceReader().read(element);
    return SourceWriter(source).write();
  }

  @override
  String toString() => 'sealed_generators';
}
