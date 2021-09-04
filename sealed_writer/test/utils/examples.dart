import 'package:sealed_writer/src/manifest/manifest.dart';

part 'examples_common.dart';
part 'examples_generic_simple.dart';
part 'examples_simple.dart';

/// ex. Equality.data
String _equality(ManifestEquality equality) {
  switch (equality) {
    case ManifestEquality.data:
      return 'Equality.data';
    case ManifestEquality.identity:
      return 'Equality.identity';
    case ManifestEquality.distinct:
      return 'Equality.distinct';
    default:
      throw AssertionError();
  }
}
