import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MapperGenerator extends GeneratorForAnnotation<Object> {
  const MapperGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return '// HELLO, THERE!';
  }

  @override
  String toString() => 'sealed_super_enum_mapper';
}
