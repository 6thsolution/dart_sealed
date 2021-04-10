import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SubConstructorWriter extends BaseUtilsWriter {
  SubConstructorWriter(Source source) : super(source);

  /// ex. required this.angle or @required this.angle
  @nonVirtual
  @visibleForTesting
  String subConstructorDeclarationPart(ManifestField field) =>
      '$req this.${field.name}';

  @nonVirtual
  @visibleForTesting
  Iterable<String> subConstructorDeclarationParts(ManifestItem item) =>
      item.fields.map(subConstructorDeclarationPart);

  /// ex. WeatherRainy({required this.rain, ...});
  @nonVirtual
  String subConstructorDeclaration(ManifestItem item) => [
        subFull(item),
        subConstructorDeclarationParts(item)
            .joinArgs()
            .withBracesOrNot()
            .withParenthesis(),
        ';',
      ].joinParts();
}
