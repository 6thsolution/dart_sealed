import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

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
  ///
  /// this is not suitable for generics.
  @nonVirtual
  String subCopyDeclaration(ManifestItem item) => [
        annotationFactory,
        [
          '${subFull(item)}$nn copy',
          subCopyDeclarationParts(item)
              .joinArgsFull()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${subFull(item)}',
          subCopyCalcParts(item).joinArgsFull().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();
}
