import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base_cast_utils_writer.dart';
import 'package:sealed_generators/src/source/writer/top_builder_writer.dart';
import 'package:sealed_generators/src/source/writer/top_cast_writer.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SourceWriter extends BaseCastUtilsWriter {
  SourceWriter(Source source)
      : topBuilderWriter = TopBuilderWriter(source),
        topCastWriter = TopCastWriter(source),
        super(source);

  @protected
  @nonVirtual
  @visibleForTesting
  final topBuilderWriter;

  @protected
  @nonVirtual
  @visibleForTesting
  final topCastWriter;

  /// ex. @SealedManifest(_Weather)
  @protected
  @nonVirtual
  @visibleForTesting
  String topManifest() => '@SealedManifest(_$top)';

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

  /// bool operator ==(Object other) => false;
  @protected
  @nonVirtual
  @visibleForTesting
  String topDistinctEquality() => [
        annotationOverride,
        'bool$nn operator ==(Object$nl other) => false;',
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
        'class ${subFull(item)} extends $top{',
        subConstructorDeclaration(item),
        subFieldDeclarations(item),
        subCopyDeclaration(item),
        subToString(item),
        if (options.equality == SealedEquality.data) subEquatableEquality(item),
        '}',
      ].joinMethods();

  /// <R extends Object?>
  @protected
  @nonVirtual
  @visibleForTesting
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArg(ManifestItem item) => '$req R Function'
      '(${subFull(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (R Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArgOrElse() => '$req R Function'
      '($top$nn $topLower)$nn orElse';

  /// (R Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNArg(ManifestItem item) => 'R Function'
      '(${subFull(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// required (void Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArg(ManifestItem item) => '$req void Function'
      '(${subFull(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (void Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArgOrElse() => '$req void Function'
      '($top$nn $topLower)$nn orElse';

  /// (void Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNArg(ManifestItem item) => 'void Function'
      '(${subFull(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// assert(sunny != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssert(ManifestItem item) =>
      'assert(${subLower(item)} != null);';

  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAsserts() => manifest.items.map(topMatchAssert).joinLines();

  /// assert(orElse != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssertOrElse() => 'assert(orElse != null);';

  /// ex. throw AssertionError();
  @protected
  @nonVirtual
  @visibleForTesting
  String throwAssertion() => 'throw AssertionError();';

  /// else clause with throw
  @protected
  @nonVirtual
  @visibleForTesting
  Else throwingElse() => Else(
        code: throwAssertion(),
      );

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @protected
  @nonVirtual
  @visibleForTesting
  If topMatchWhenIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${subLower(item)}($topLower);',
      );

  /// body of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: manifest.items.map(topMatchWhenIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        manifest.items
            .map(topMatchGenericNNArg)
            .joinArgs()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// R when<R extends Object?>(required item...)
  /// {...}
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhen() => [
        topMatchWhenStart(),
        '{',
        if (!options.isNullSafe) topMatchAsserts(),
        topMatchWhenBody(),
        '}',
      ].joinLines();

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @protected
  @nonVirtual
  @visibleForTesting
  If topMatchWhenOrElseIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return (${subLower(item)} ?? orElse)($topLower);',
      );

  /// body of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: manifest.items.map(topMatchWhenOrElseIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElseStart() => [
        'R whenOrElse$topMatchParam',
        [
          ...manifest.items.map(topMatchGenericNArg),
          topMatchGenericNNArgOrElse(),
        ].joinArgs().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrElse<R extends Object?>(item..., required orElse) {...}
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWhenOrElse() => [
        topMatchWhenOrElseStart(),
        '{',
        if (!options.isNullSafe) topMatchAssertOrElse(),
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> topMethods() => [
        ...topBuilderWriter.topBuilderMethods(),
        ...topCastWriter.topCastMethods(),
        ...topMatchMethods(),
        if (options.equality == SealedEquality.distinct) topDistinctEquality(),
      ];

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> topMatchMethods() => [
        topMatchWhen(),
        topMatchWhenOrElse(),
      ];

  @protected
  @nonVirtual
  @visibleForTesting
  String topClassStart() => [
        topManifest(),
        [
          'abstract class $top',
          if (options.equality == SealedEquality.data) ' extends Equatable',
        ].joinParts()
      ].joinLines();

  @protected
  @nonVirtual
  @visibleForTesting
  String topClass() => [
        topClassStart(),
        '{',
        ...topMethods(),
        '}',
      ].joinMethods();

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> subClasses() => manifest.items.map(subClass);

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> classes() => [
        topClass(),
        ...subClasses(),
      ];

  @nonVirtual
  String write() => classes().joinMethods();
}

// todo can have super class with utilities and sub specialized classes
// todo remove tr() usages
// todo : super._() Weather._();
// todo use mockito
