import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/options/reader/null_safety_reader.dart';
import 'package:source_gen/source_gen.dart';

/// options reader
@sealed
@immutable
class OptionsReader {
  const OptionsReader();

  Options read(
    Element element,
    ConstantReader annotation,
  ) =>
      Options(
        isNullSafe: const NullSafetyReader().readIsNullSafe(element),
      );
}
