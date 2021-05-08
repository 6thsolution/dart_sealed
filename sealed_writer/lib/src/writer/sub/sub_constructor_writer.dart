import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

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
            .joinArgsFull()
            .withBracesOrNot()
            .withParenthesis(),
        ';',
      ].joinParts();
}
