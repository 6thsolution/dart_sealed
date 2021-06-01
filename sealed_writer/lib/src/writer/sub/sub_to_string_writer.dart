import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// source writer
@sealed
@immutable
class SubToStringWriter extends BaseUtilsWriter {
  const SubToStringWriter(Source source) : super(source);

  /// ex. rain: $rain
  String subToStringPart(ManifestField field) =>
      '${field.name}: \$${field.name}';

  /// ex. @override String toString() => 'Weather.rainy(rain: $rain)'
  /// or: String/*!*/
  String subToString(ManifestItem item) => [
        annotationOverride,
        [
          "String$nn toString() => '$top.${subLower(item)}",
          item.fields.map(subToStringPart).joinArgsSimple().withParenthesis(),
          "';",
        ].joinParts(),
      ].joinLines();
}
