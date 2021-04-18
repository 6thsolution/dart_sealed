import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward/backward_writer.dart';

part 'examples_generic_simple.dart';
part 'examples_simple.dart';

const optionsDataSafe = Options(
  equality: Equality.data,
  isNullSafe: true,
);
const optionsIdentitySafe = Options(
  equality: Equality.identity,
  isNullSafe: true,
);
const optionsDistinctSafe = Options(
  equality: Equality.distinct,
  isNullSafe: true,
);
const optionsDataLegacy = Options(
  equality: Equality.data,
  isNullSafe: false,
);
const optionsIdentityLegacy = Options(
  equality: Equality.identity,
  isNullSafe: false,
);
const optionsDistinctLegacy = Options(
  equality: Equality.distinct,
  isNullSafe: false,
);
