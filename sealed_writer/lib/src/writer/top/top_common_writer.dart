import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top common writer
class TopCommonWriter extends BaseUtilsWriter {
  const TopCommonWriter(Manifest manifest) : super(manifest);

  /// common getter
  /// ex. String get x;
  String topCommonGetter(ManifestField field) =>
      '${typeSL(field.type)} get ${field.name};';

  /// common getters
  Iterable<String> topCommonGetters() => manifest.fields.map(topCommonGetter);
}
