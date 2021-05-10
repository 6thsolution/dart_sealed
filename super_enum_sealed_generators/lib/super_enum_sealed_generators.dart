/// Sealed Generators
library super_enum_sealed_generators;

import 'package:build/build.dart';
import 'package:super_enum_sealed_generators/src/builder.dart';

/// Builder for mapping super_enum to dart_sealed
Builder superEnumSealedGeneratorsBuilder(BuilderOptions options) =>
    mapperBuilder();
