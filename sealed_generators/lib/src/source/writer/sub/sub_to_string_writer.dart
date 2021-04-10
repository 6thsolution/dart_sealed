import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SubToStringWriter extends BaseUtilsWriter {
  const SubToStringWriter(Source source) : super(source);

  /// ex. rain: $rain
  @nonVirtual
  @visibleForTesting
  String subToStringPart(ManifestField field) =>
      '${field.name}: \$${field.name}';

  /// ex. @override String toString() => 'Weather.rainy(rain: $rain)'
  /// or: String/*!*/
  @nonVirtual
  String subToString(ManifestItem item) => [
        annotationOverride,
        [
          "String$nn toString() => '$top.${subLower(item)}",
          item.fields.map(subToStringPart).joinArgsSimple().withParenthesis(),
          "';",
        ].joinParts(),
      ].joinLines();
}
