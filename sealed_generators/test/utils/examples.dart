import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';

part 'examples_generic_simple.dart';
part 'examples_simple.dart';

const optionsSafe = Options(isNullSafe: true);

const optionsLegacy = Options(isNullSafe: false);
