import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward/backward_writer.dart';

part 'examples_generic_simple.dart';
part 'examples_simple.dart';

const optionsDataSafe = Options(
  equality: SealedEquality.data,
  isNullSafe: true,
);
const optionsIdentitySafe = Options(
  equality: SealedEquality.identity,
  isNullSafe: true,
);
const optionsDistinctSafe = Options(
  equality: SealedEquality.distinct,
  isNullSafe: true,
);
const optionsDataLegacy = Options(
  equality: SealedEquality.data,
  isNullSafe: false,
);
const optionsIdentityLegacy = Options(
  equality: SealedEquality.identity,
  isNullSafe: false,
);
const optionsDistinctLegacy = Options(
  equality: SealedEquality.distinct,
  isNullSafe: false,
);
