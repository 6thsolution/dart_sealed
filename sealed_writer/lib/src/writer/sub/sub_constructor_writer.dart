import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// source writer
@sealed
@immutable
class SubConstructorWriter extends BaseUtilsWriter {
  SubConstructorWriter(Manifest manifest) : super(manifest);

  /// ex. required this.angle or @required this.angle
  String subConstructorDecArg(ManifestField field) => '$req this.${field.name}';

  /// ex. ({required this.angle,})
  String subConstructorDecArgs(ManifestItem item) => item.fields
      .map(subConstructorDecArg)
      .joinArgsFull()
      .withBracesOrNot()
      .withParenthesis();

  /// ex. required this.angle or @required this.angle
  String subConstructorWrappedDecArg(ManifestField field) =>
      'this.${field.name}';

  /// ex. ({required this.angle,})
  String subConstructorWrappedDecArgs(ManifestItem item) => item.fields
      .map(subConstructorWrappedDecArg)
      .joinArgsFull()
      .withParenthesis();

  /// ex. WeatherRainy({required this.rain, ...});
  String subConstructorDeclaration(ManifestItem item) => [
        'const ',
        subFull(item),
        subConstructorDecArgs(item),
        ': super._internal();',
      ].joinParts();
}
