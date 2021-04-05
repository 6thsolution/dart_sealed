import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

class SourceWriter {
  SourceWriter(this.source);

  final Source source;

  @visibleForTesting
  Options get opts => source.options;

  @visibleForTesting
  Manifest get man => source.manifest;

  /// @sealed final (closed) class
  @visibleForTesting
  String get closed => '@sealed';

  /// @immutable
  @visibleForTesting
  String get immutable => '@immutable';

  /// @factory
  @visibleForTesting
  String get factory => '@factory';

  /// @override
  @visibleForTesting
  String get over => '@override';

  /// nullability suffix: "?" or "/*?*/"
  @visibleForTesting
  String get n => opts.isNullSafe ? '?' : '/*?*/';

  /// only nullable in legacy
  @visibleForTesting
  String get nl => opts.isNullSafe ? '' : '/*?*/';

  /// non-nullability suffix: "" or "/*!*/"
  @visibleForTesting
  String get nn => opts.isNullSafe ? '' : '/*!*/';

  /// required or @required
  @visibleForTesting
  String get req => opts.isNullSafe ? 'required' : '@required';

  /// top class name, ex. Weather
  @visibleForTesting
  String get top => man.name;

  /// top class name with lower start, ex. weather
  @visibleForTesting
  String get topLower => top.toLowerStart();

  /// short sub class name, ex. Sunny
  @visibleForTesting
  String short(ManifestItem item) => item.name;

  /// sub class name, ex. WeatherSunny
  @visibleForTesting
  String full(ManifestItem item) => '$top${short(item)}';

  /// lower start short sub class name, ex. sunny
  @visibleForTesting
  String lower(ManifestItem item) => short(item).toLowerStart();

  /// ex. is WeatherRainy
  @visibleForTesting
  String isSub(ManifestItem item) => 'is ${full(item)}$nn';

  /// ex. as WeatherRainy
  @visibleForTesting
  String asSub(ManifestItem item) => 'as ${full(item)}$nn';

  /// ex. isRainy()
  @visibleForTesting
  String topCastIs(ManifestItem item) =>
      'bool is${short(item)}() => this ${isSub(item)};';

  @visibleForTesting
  Iterable<String> topCastsIs() => man.items.map(topCastIs);

  /// ex. asRainy()
  @visibleForTesting
  String topCastAs(ManifestItem item) =>
      '${full(item)}$nn as${short(item)}() =>'
      ' this ${asSub(item)};';

  @visibleForTesting
  Iterable<String> topCastsAs() => man.items.map(topCastAs);

  /// ex. final weather = this;
  @visibleForTesting
  String initThisValue() => 'final $topLower = this;';

  /// ex. asRainyOrNull()
  @visibleForTesting
  String topCastAsOrNull(ManifestItem item) => [
        '${full(item)}$n as${short(item)}OrNull() {',
        initThisValue(),
        'return $topLower ${isSub(item)} ? $topLower : null;',
        '}',
      ].joinLines();

  @visibleForTesting
  Iterable<String> topCastsAsOrNull() => man.items.map(topCastAsOrNull);

  @visibleForTesting
  Iterable<String> topCastMethods() => [
        ...topCastsIs(),
        ...topCastsAs(),
        ...topCastsAsOrNull(),
      ];

  /// ex. @SealedManifest(_Weather)
  @visibleForTesting
  String topManifest() => '@SealedManifest(_$top)';

  /// ex. double or double/*!*/, double? or double/*?*/
  @visibleForTesting
  String typeSL(ManifestType type) =>
      type.isNullable ? '${type.name}$n' : '${type.name}$nn';

  /// ex. final double direction;
  @visibleForTesting
  String subFieldDeclaration(ManifestField field) =>
      'final ${typeSL(field.type)} ${field.name};';

  @visibleForTesting
  String subFieldDeclarations(ManifestItem item) =>
      item.fields.map(subFieldDeclaration).joinLines();

  /// ex. required this.angle or @required this.angle
  @visibleForTesting
  String subConstructorDeclarationPart(ManifestField field) =>
      '$req this.${field.name}';

  /// ex. WeatherRainy({required this.rain, ...});
  @visibleForTesting
  String subConstructorDeclaration(ManifestItem item) => [
        full(item),
        item.fields
            .map(subConstructorDeclarationPart)
            .joinArgs()
            .withBracesOrNot()
            .withParenthesis(),
        ';',
      ].joinParts();

  /// ex. angle: angle
  @visibleForTesting
  String subConstructorCallArg(ManifestField field) =>
      '${field.name}: ${field.name}';

  /// ex. required double? angle
  @visibleForTesting
  String topBuilderArg(ManifestField field) =>
      '$req ${typeSL(field.type)} ${field.name}';

  /// ex. static ... rainy() => ...
  @visibleForTesting
  String topBuilder(ManifestItem item) => [
        factory,
        [
          'static ${full(item)}$nn ${lower(item)}',
          item.fields
              .map(topBuilderArg)
              .joinArgs()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${full(item)}',
          item.fields.map(subConstructorCallArg).joinArgs().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();

  @visibleForTesting
  Iterable<String> topBuilderMethods() => man.items.map(topBuilder);

  /// ex. rain: $rain
  @visibleForTesting
  String subToStringPart(ManifestField field) =>
      '${field.name}: \$${field.name}';

  /// ex. @override String toString() => 'Weather.rainy(rain: $rain)'
  /// or: String/*!*/
  @visibleForTesting
  String subToString(ManifestItem item) => [
        over,
        [
          "String$nn toString() => '$top.${lower(item)}",
          item.fields.map(subToStringPart).joinArgsSimple().withParenthesis(),
          "';",
        ].joinParts(),
      ].joinLines();

  /// bool operator ==(Object other) => false;
  @visibleForTesting
  String topDistinctEquality() => [
        over,
        'bool$nn operator ==(Object$nl other) => false;',
      ].joinLines();

  /// List<Object?> get props => [a, b, ...];
  @visibleForTesting
  String subEquatableEquality(ManifestItem item) => [
        over,
        [
          'List<Object$n>$nn get props => [',
          item.fields.map((field) => field.name).joinArgs(),
          '];',
        ].joinParts(),
      ].joinLines();

  /// ex. int? rain
  @visibleForTesting
  String subCopyDeclarationPart(ManifestField field) =>
      '${field.type.name}$n ${field.name}';

  /// ex. rain: rain ?? this.rain
  @visibleForTesting
  String subCopyCalcPart(ManifestField field) =>
      '${field.name}: ${field.name} ?? this.${field.name}';

  /// ex. WeatherRainy copy({int? rain})
  /// => WeatherRainy(rain: rain ?? this.rain);
  @visibleForTesting
  String subCopyDeclaration(ManifestItem item) => [
        factory,
        [
          '${full(item)}$nn copy',
          item.fields
              .map(subCopyDeclarationPart)
              .joinArgs()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${full(item)}',
          item.fields.map(subCopyCalcPart).joinArgs().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();

  /// write subclass
  @visibleForTesting
  String subClass(ManifestItem item) => [
        'class ${full(item)} extends $top{',
        subConstructorDeclaration(item),
        subFieldDeclarations(item),
        subCopyDeclaration(item),
        subToString(item),
        if (opts.equality == SealedEquality.data) subEquatableEquality(item),
        '}',
      ].joinMethods();

  /// <R extends Object?>
  @visibleForTesting
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  @visibleForTesting
  String topMatchGenericNNArg(ManifestItem item) =>
      '$req R Function(${full(item)}$nn ${lower(item)})$nn ${lower(item)}';

  /// required (R Function(Weather weather)) orElse
  @visibleForTesting
  String topMatchGenericNNArgOrElse() =>
      '$req R Function($top$nn $topLower)$nn orElse';

  /// (R Function(WeatherSunny sunny))? sunny
  @visibleForTesting
  String topMatchGenericNArg(ManifestItem item) =>
      'R Function(${full(item)}$nn ${lower(item)})$n ${lower(item)}';

  /// required (void Function(WeatherSunny sunny)) sunny
  @visibleForTesting
  String topMatchVoidNNArg(ManifestItem item) =>
      '$req void Function(${full(item)}$nn ${lower(item)})$nn ${lower(item)}';

  /// required (void Function(Weather weather)) orElse
  @visibleForTesting
  String topMatchVoidNNArgOrElse() =>
      '$req void Function($top$nn $topLower)$nn orElse';

  /// (void Function(WeatherSunny sunny))? sunny
  @visibleForTesting
  String topMatchVoidNArg(ManifestItem item) =>
      'void Function(${full(item)}$nn ${lower(item)})$n ${lower(item)}';

  /// assert(sunny != null)
  @visibleForTesting
  String topMatchAssert(ManifestItem item) => 'assert(${lower(item)} != null);';

  @visibleForTesting
  String topMatchAsserts() => man.items.map(topMatchAssert).joinLines();

  /// assert(orElse != null)
  @visibleForTesting
  String topMatchAssertOrElse() => 'assert(orElse != null);';

  /// ex. throw AssertionError();
  @visibleForTesting
  String throwAssertion() => 'throw AssertionError();';

  /// else clause with throw
  @visibleForTesting
  Else throwingElse() => Else(
        code: throwAssertion(),
      );

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @visibleForTesting
  If topMatchWhenIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return ${lower(item)}($topLower);',
      );

  /// body of when method
  @visibleForTesting
  String topMatchWhenBody() => [
        initThisValue(),
        Branch(
          ifs: man.items.map(topMatchWhenIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @visibleForTesting
  String topMatchWhenStart() => [
        'R when$topMatchParam',
        man.items
            .map(topMatchGenericNNArg)
            .joinArgs()
            .withBraces()
            .withParenthesis(),
      ].joinParts();

  /// R when<R extends Object?>(required item...)
  /// {...}
  @visibleForTesting
  String topMatchWhen() => [
        topMatchWhenStart(),
        '{',
        if (!opts.isNullSafe) topMatchAsserts(),
        topMatchWhenBody(),
        '}',
      ].joinLines();

  /// ex. if (weather is WeatherSunny) { return sunny(weather); }
  @visibleForTesting
  If topMatchWhenOrElseIfs(ManifestItem item) => If(
        condition: '$topLower ${isSub(item)}',
        code: 'return (${lower(item)} ?? orElse)($topLower);',
      );

  /// body of when method
  @visibleForTesting
  String topMatchWhenOrElseBody() => [
        initThisValue(),
        Branch(
          ifs: man.items.map(topMatchWhenOrElseIfs).toList(),
          els: throwingElse(),
        ).join(),
      ].joinLines();

  /// start of when method
  @visibleForTesting
  String topMatchWhenOrElseStart() => [
        'R whenOrElse$topMatchParam',
        [
          ...man.items.map(topMatchGenericNArg),
          topMatchGenericNNArgOrElse(),
        ].joinArgs().withBraces().withParenthesis(),
      ].joinParts();

  /// R whenOrElse<R extends Object?>(item..., required orElse) {...}
  @visibleForTesting
  String topMatchWhenOrElse() => [
        topMatchWhenOrElseStart(),
        '{',
        if (!opts.isNullSafe) topMatchAssertOrElse(),
        topMatchWhenOrElseBody(),
        '}',
      ].joinLines();

  @visibleForTesting
  Iterable<String> topMethods() => [
        ...topBuilderMethods(),
        ...topCastMethods(),
        ...topMatchMethods(),
        if (opts.equality == SealedEquality.distinct) topDistinctEquality(),
      ];

  // ****
  // todo not tested:
  // ****

  @visibleForTesting
  Iterable<String> topMatchMethods() => [
        topMatchWhen(),
        topMatchWhenOrElse(),
      ];

  // todo can have super class with utilities and sub specialized classes
  // todo remove tr() usages
  // todo we can make all returns iterables of lines
  // todo : super._()
  // todo : Weather._();
  // todo copy constructors
  // todo use mockito
  // todo sub class private constructor
  // todo sub class positional constructor args ?

  // **** //

  String write() {
    final s = StringBuffer();
    s.writeln(writeTopClass());
    for (final item in man.items) {
      s.writeln(subClass(item));
      s.writeln();
    }
    return s.toString();
  }

  @visibleForTesting
  String writeTopClass() {
    final s = StringBuffer();
    s.writeln(topManifest());
    s.write('abstract class ${man.name}');
    if (opts.equality == SealedEquality.data) {
      s.write(' extends Equatable');
    }
    s.writeln('{');
    s.writeln(topMethods().joinMethods());
    s.writeln('}');
    return s.toString();
  }
}
