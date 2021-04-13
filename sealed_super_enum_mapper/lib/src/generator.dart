import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_super_enum_mapper/src/mapper.dart';
import 'package:source_gen/source_gen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:super_enum/super_enum.dart';

class MapperGenerator extends GeneratorForAnnotation<SuperEnum> {
  const MapperGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      map(element);

  @override
  String toString() => 'sealed_super_enum_mapper';
}
