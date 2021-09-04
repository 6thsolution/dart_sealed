import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// source writer
class SubFieldWriter extends BaseUtilsWriter {
  const SubFieldWriter(Manifest manifest) : super(manifest);

  /// extract field name
  static String _fieldName(ManifestField field) => field.name;

  /// check if is a common field
  bool subFieldIsCommon(ManifestField field) =>
      manifest.fields.map(_fieldName).contains(field.name);

  /// ex. final double direction;
  String subFieldDeclaration(ManifestField field) => [
        if (subFieldIsCommon(field)) annotationOverride,
        'final ${typeSL(field.type)} ${field.name};',
      ].joinLines();

  Iterable<String> subFieldDeclarationList(ManifestItem item) =>
      item.fields.map(subFieldDeclaration);

  String subFieldDeclarations(ManifestItem item) =>
      subFieldDeclarationList(item).joinLines();
}
