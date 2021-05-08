import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

/// read null-safety state
@sealed
@immutable
class NullSafetyReader {
  const NullSafetyReader();

  static final _nullSafeVersion = Version.parse('2.12.0');

  bool readIsNullSafe(Element element) =>
      element.library!.languageVersion.effective >= _nullSafeVersion;
}
