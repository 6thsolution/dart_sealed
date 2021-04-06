import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SubWriter extends BaseUtilsWriter {
  const SubWriter(Source source) : super(source);

  /// has nullable fields
  @protected
  @nonVirtual
  @visibleForTesting
  bool hasNullable(ManifestItem item) =>
      item.fields.map((field) => field.type).any((type) => type.isNullable);

  /// ex. final double direction;
  @protected
  @nonVirtual
  @visibleForTesting
  String subFieldDeclaration(ManifestField field) =>
      'final ${typeSL(field.type)} ${field.name};';

  @protected
  @nonVirtual
  @visibleForTesting
  String subFieldDeclarations(ManifestItem item) =>
      item.fields.map(subFieldDeclaration).joinLines();

  /// ex. required this.angle or @required this.angle
  @protected
  @nonVirtual
  @visibleForTesting
  String subConstructorDeclarationPart(ManifestField field) =>
      '$req this.${field.name}';

  /// ex. WeatherRainy({required this.rain, ...});
  @protected
  @nonVirtual
  @visibleForTesting
  String subConstructorDeclaration(ManifestItem item) => [
        subFull(item),
        item.fields
            .map(subConstructorDeclarationPart)
            .joinArgs()
            .withBracesOrNot()
            .withParenthesis(),
        ';',
      ].joinParts();

  /// ex. rain: $rain
  @protected
  @nonVirtual
  @visibleForTesting
  String subToStringPart(ManifestField field) =>
      '${field.name}: \$${field.name}';

  /// ex. @override String toString() => 'Weather.rainy(rain: $rain)'
  /// or: String/*!*/
  @protected
  @nonVirtual
  @visibleForTesting
  String subToString(ManifestItem item) => [
        annotationOverride,
        [
          "String$nn toString() => '$top.${subLower(item)}",
          item.fields.map(subToStringPart).joinArgsSimple().withParenthesis(),
          "';",
        ].joinParts(),
      ].joinLines();

  /// List<Object?> get props => [a, b, ...];
  @protected
  @nonVirtual
  @visibleForTesting
  String subEquatableEquality(ManifestItem item) => [
        annotationOverride,
        [
          'List<Object$n>$nn get props => [',
          item.fields.map((field) => field.name).joinArgs(),
          '];',
        ].joinParts(),
      ].joinLines();

  /// ex. int? rain
  @protected
  @nonVirtual
  @visibleForTesting
  String subCopyDeclarationPart(ManifestField field) =>
      '${field.type.name}$n ${field.name}';

  /// ex. rain: rain ?? this.rain
  @protected
  @nonVirtual
  @visibleForTesting
  String subCopyCalcPart(ManifestField field) =>
      '${field.name}: ${field.name} ?? this.${field.name}';

  /// ex. WeatherRainy copy({int? rain})
  /// => WeatherRainy(rain: rain ?? this.rain);
  @protected
  @nonVirtual
  @visibleForTesting
  String subCopyDeclaration(ManifestItem item) => [
        annotationFactory,
        [
          '${subFull(item)}$nn copy',
          item.fields
              .map(subCopyDeclarationPart)
              .joinArgs()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${subFull(item)}',
          item.fields.map(subCopyCalcPart).joinArgs().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();

  /// write subclass
  @protected
  @nonVirtual
  @visibleForTesting
  String subClass(ManifestItem item) => [
        'class ${subFull(item)} extends $top',
        '{',
        subConstructorDeclaration(item),
        subFieldDeclarations(item),
        if (!hasNullable(item)) subCopyDeclaration(item),
        subToString(item),
        if (options.equality == SealedEquality.data) subEquatableEquality(item),
        '}',
      ].joinMethods();

  @nonVirtual
  Iterable<String> subClasses() => manifest.items.map(subClass);
}
