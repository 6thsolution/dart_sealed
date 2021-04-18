import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/options/reader/null_safety_reader.dart';
import 'package:source_gen/source_gen.dart';

/// todo test read
@sealed
@immutable
class OptionsReader {
  const OptionsReader();

  Options read(
    Element element,
    ConstantReader annotation,
  ) {
    const nullSafety = NullSafetyReader();
    return Options(
      equality: _readEquality(annotation),
      isNullSafe: nullSafety.readIsNullSafe(element),
    );
  }

  /// read equality
  Equality _readEquality(ConstantReader annotation) {
    final index = annotation.read('equality').read('index').intValue;
    return Equality.values[index];
  }
}
