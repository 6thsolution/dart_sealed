import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:sealed_writer/sealed_writer.dart';

/// read null-safety state
@sealed
@immutable
class NullSafety {
  const NullSafety();

  static final _nullSafeVersion = Version.parse('2.12.0');

  void checkIsNullSafe(Element element) {
    require(
      element.library!.languageVersion.effective >= _nullSafeVersion,
      'dart_sealed only supports nul-safe code.',
    );
  }
}
