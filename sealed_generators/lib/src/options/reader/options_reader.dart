import 'package:analyzer/dart/element/element.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:source_gen/source_gen.dart';

class OptionsReader {
  const OptionsReader();

  static final _nullSafeVersion = Version.parse('2.12.0');

  Options read(
    Element element,
    ConstantReader annotation,
  ) {
    final index = annotation.read('equality').read('index').intValue;
    final equality = SealedEquality.values[index];

    final version = element.library!.languageVersion.effective;
    final isNullSafe = version >= _nullSafeVersion;

    return Options(
      equality: equality,
      isNullSafe: isNullSafe,
    );
  }
}
