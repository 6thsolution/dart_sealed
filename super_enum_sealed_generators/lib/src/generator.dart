import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';
import 'package:super_enum_sealed_generators/src/reader.dart';
import 'package:super_enum_sealed_generators/src/writer.dart';

/// generator
class MapperGenerator extends GeneratorForAnnotation<SuperEnum> {
  const MapperGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final source = const Reader().read(element);
    return const Writer().write(source);
  }

  @override
  String toString() => 'super_enum_sealed_generators';
}
