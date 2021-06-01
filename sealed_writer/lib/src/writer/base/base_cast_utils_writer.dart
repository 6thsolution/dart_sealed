import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top cast writer
@immutable
abstract class BaseCastUtilsWriter extends BaseUtilsWriter {
  const BaseCastUtilsWriter(Source source) : super(source);

  /// ex. is WeatherRainy
  String isSub(ManifestItem item) => 'is ${subCall(item)}';

  /// ex. as WeatherRainy
  String asSub(ManifestItem item) => 'as ${subCall(item)}';
}
