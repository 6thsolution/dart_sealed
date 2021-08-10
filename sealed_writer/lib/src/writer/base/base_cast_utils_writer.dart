import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top cast writer
abstract class BaseCastUtilsWriter extends BaseUtilsWriter {
  const BaseCastUtilsWriter(Manifest manifest) : super(manifest);

  /// ex. is WeatherRainy
  String isSub(ManifestItem item) => 'is ${subCall(item)}';

  /// ex. as WeatherRainy
  String asSub(ManifestItem item) => 'as ${subCall(item)}';
}
