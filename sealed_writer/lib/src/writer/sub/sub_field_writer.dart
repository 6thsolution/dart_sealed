import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// source writer
class SubFieldWriter extends BaseUtilsWriter {
  const SubFieldWriter(Manifest manifest) : super(manifest);

  /// ex. final double direction;
  String subFieldDeclaration(ManifestField field) =>
      'final ${typeSL(field.type)} ${field.name};';

  Iterable<String> subFieldDeclarationList(ManifestItem item) =>
      item.fields.map(subFieldDeclaration);

  String subFieldDeclarations(ManifestItem item) =>
      subFieldDeclarationList(item).joinLines();
}
