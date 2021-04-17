import 'package:build/build.dart';
import 'package:sealed_super_enum_mapper/src/generator.dart';
import 'package:source_gen/source_gen.dart';

/// builder
Builder mapperBuilder() {
  return PartBuilder(
    const [MapperGenerator()],
    '.super.dart',
  );
}
