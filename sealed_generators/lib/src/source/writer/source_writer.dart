import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

extension SourceWriter on Source {
  /// @sealed final (closed) class
  @visibleForTesting
  String get closed => '@sealed';

  /// @immutable
  @visibleForTesting
  String get immutable => '@immutable';

  /// @factory
  @visibleForTesting
  String get factory => '@factory';

  /// nullability suffix: "?" or "/*?*/"
  @visibleForTesting
  String get n => options.isNullSafe ? '?' : '/*?*/';

  /// non-nullability suffix: "" or "/*!*/"
  @visibleForTesting
  String get nn => options.isNullSafe ? '' : '/*!*/';

  /// required or @required
  @visibleForTesting
  String get req => options.isNullSafe ? 'required' : '@required';

  /// top class name, ex. Weather
  @visibleForTesting
  String get top => manifest.name;

  /// short sub class name, ex. Sunny
  @visibleForTesting
  String short(ManifestItem item) => item.name;

  /// sub class name, ex. WeatherSunny
  @visibleForTesting
  String full(ManifestItem item) => '$top${short(item)}';

  /// lower start short sub class name, ex. sunny
  @visibleForTesting
  String lower(ManifestItem item) => short(item).toLowerStart();

  /// ex. isRainy()
  @visibleForTesting
  String topCastIs(ManifestItem item) =>
      'bool is${short(item)}() => this is ${full(item)};';

  @visibleForTesting
  Iterable<String> topCastsIs() => manifest.items.map(topCastIs);

  /// ex. asRainy()
  @visibleForTesting
  String topCastAs(ManifestItem item) =>
      '${full(item)}$nn as${short(item)}() =>'
      ' this as ${full(item)};';

  @visibleForTesting
  Iterable<String> topCastsAs() => manifest.items.map(topCastAs);

  /// ex. asRainyOrNull()
  @visibleForTesting
  String topCastAsOrNull(ManifestItem item) =>
      '${full(item)}$n as${short(item)}OrNull() => '
      ' this is ${full(item)} ? this as ${full(item)} : null;';

  @visibleForTesting
  Iterable<String> topCastsAsOrNull() => manifest.items.map(topCastAsOrNull);

  @visibleForTesting
  Iterable<String> topCasts() sync* {
    yield* topCastsIs();
    yield* topCastsAs();
    yield* topCastsAsOrNull();
  }

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
  Iterable<String> subFieldDeclarations(ManifestItem item) =>
      item.fields.map(subFieldDeclaration);

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
          '${full(item)}$nn ${lower(item)}',
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
  Iterable<String> topBuilders() => manifest.items.map(topBuilder);

  // todo use mockito
  // todo rename methods
  // todo sub class private constructor
  // todo sub class positional constructor args ?
  // todo null assertion for legacy ? time !!
  // todo add line joining
  // todo trailing comma

  // **** //

  String write() {
    final s = StringBuffer();
    s.writeln(writeTopClass());
    for (final item in manifest.items) {
      s.writeln(writeSubClass(item));
      s.writeln();
    }
    return s.toString();
  }

  @visibleForTesting
  String writeTopClass() {
    final s = StringBuffer();
    s.writeln(topManifest());
    s.write('abstract class ${manifest.name}');
    if (options.equality == SealedEquality.data) {
      s.write(' extends Equatable');
    }
    s.writeln('{');
    s.writeln(topBuilders().joinMethods());
    s.writeln(topCasts().joinMethods());
    s.writeln('}');
    return s.toString();
  }

  @visibleForTesting
  String writeSubClass(ManifestItem item) {
    final s = StringBuffer();
    s.write('class ${full(item)} extends $top{');
    s.writeln(subConstructorDeclaration(item));
    s.writeln();
    s.writeln(subFieldDeclarations(item).joinLines());
    if (options.equality == SealedEquality.data) {
      s.writeln();
      s.writeln('@override');
      if (options.isNullSafe) {
        s.writeln('List<Object?> get props => [];');
      } else {
        s.writeln('List<Object/*?*/> get props => [];');
      }
    }
    s.writeln('}');
    return s.toString();
  }
}
