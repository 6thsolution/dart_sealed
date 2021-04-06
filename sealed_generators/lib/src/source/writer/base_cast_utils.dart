import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base_utils.dart';


/// top cast writer
@immutable
abstract class BaseCastUtilsWriter extends BaseUtilsWriter {
  const BaseCastUtilsWriter(Source source) : super(source);

  /// ex. is WeatherRainy
  @protected
  @nonVirtual
  @visibleForTesting
  String isSub(ManifestItem item) => 'is ${subFull(item)}$nn';

  /// ex. as WeatherRainy
  @protected
  @nonVirtual
  @visibleForTesting
  String asSub(ManifestItem item) => 'as ${subFull(item)}$nn';
}
