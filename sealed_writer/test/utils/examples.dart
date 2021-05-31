import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/options/options.dart';
import 'package:sealed_writer/src/source/source.dart';

part 'examples_generic_simple.dart';
part 'examples_generic_simple_wrap.dart';
part 'examples_simple.dart';
part 'examples_simple_wrap.dart';

const optionsSafe = Options(isNullSafe: true);

const optionsLegacy = Options(isNullSafe: false);

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
