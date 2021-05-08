import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/options/null_safety_reader.dart';
import 'package:sealed_writer/sealed_writer.dart';
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
