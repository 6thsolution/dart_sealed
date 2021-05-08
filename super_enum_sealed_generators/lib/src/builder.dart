import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:super_enum_sealed_generators/src/generator.dart';

/// builder
Builder mapperBuilder() {
  return PartBuilder(
    const [MapperGenerator()],
    '.super.dart',
  );
}
