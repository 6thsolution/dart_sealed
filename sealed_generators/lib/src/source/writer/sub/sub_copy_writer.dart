import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SubCopyWriter extends BaseUtilsWriter {
  const SubCopyWriter(Source source) : super(source);

  /// ex. int? rain
  @nonVirtual
  @visibleForTesting
  String subCopyDeclarationPart(ManifestField field) =>
      '${field.type.name}$n ${field.name}';

  @nonVirtual
  @visibleForTesting
  Iterable<String> subCopyDeclarationParts(ManifestItem item) =>
      item.fields.map(subCopyDeclarationPart);

  /// ex. rain: rain ?? this.rain
  @nonVirtual
  @visibleForTesting
  String subCopyCalcPart(ManifestField field) =>
      '${field.name}: ${field.name} ?? this.${field.name}';

  @nonVirtual
  @visibleForTesting
  Iterable<String> subCopyCalcParts(ManifestItem item) =>
      item.fields.map(subCopyCalcPart);

  /// ex. WeatherRainy copy({int? rain})
  /// => WeatherRainy(rain: rain ?? this.rain);
  @nonVirtual
  String subCopyDeclaration(ManifestItem item) => [
        annotationFactory,
        [
          '${subFull(item)}$nn copy',
          subCopyDeclarationParts(item)
              .joinArgs()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${subFull(item)}',
          subCopyCalcParts(item).joinArgs().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();
}
