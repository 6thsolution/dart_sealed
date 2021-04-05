import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/reader/source_reader.dart';
import 'package:sealed_generators/src/source/writer/backward_source_writer.dart';
import 'package:sealed_generators/src/source/writer/param_compat_source_writer.dart';
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
    final reader = SourceReader();
    final source = reader.read(element, annotation);
    final backwardWriter = BackwardSourceWriter(source: source);
    final paramCompatWriter = ParamCompatSourceWriter(source: source);

    final s = StringBuffer();
    s.writeln(paramCompatWriter.write(debug: true));
    s.writeln(backwardWriter.write(debug: true));
    s.writeln(source.write());
    return s.toString();
  }

  @override
  String toString() => 'sealed_generators';
}
