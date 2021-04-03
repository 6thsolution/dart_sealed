import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

extension SourceWriter on Source {
  /// nullability suffix: "?" or "/*?*/"
  @visibleForTesting
  String get n => options.isNullSafe ? '?' : '/*?*/';

  /// non-nullability suffix: "" or "/*!*/"
  @visibleForTesting
  String get nn => options.isNullSafe ? '' : '/*!*/';

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
  String topCastIsItem(ManifestItem item) =>
      'bool is${short(item)}() => this is ${full(item)};';

  @visibleForTesting
  String topCastsIs() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(topCastIsItem(item));
      s.writeln();
    }
    return s.toString();
  }

  /// ex. asRainy()
  @visibleForTesting
  String topCastAsItem(ManifestItem item) =>
      '${full(item)}$nn as${short(item)}() =>'
      ' this as ${full(item)};';

  @visibleForTesting
  String topCastsAs() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(topCastAsItem(item));
      s.writeln();
    }
    return s.toString();
  }

  /// ex. asRainyOrNull()
  @visibleForTesting
  String topCastAsOrNullItem(ManifestItem item) =>
      '${full(item)}$n as${short(item)}OrNull() => '
      ' this is ${full(item)} ? this as ${full(item)} : null;';

  @visibleForTesting
  String topCastsAsOrNull() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(topCastAsOrNullItem(item));
      s.writeln();
    }
    return s.toString();
  }

  @visibleForTesting
  String topCasts() {
    final s = StringBuffer();
    s.write(topCastsIs());
    s.write(topCastsAs());
    s.write(topCastsAsOrNull());
    return s.toString();
  }

  String topManifest() => '@SealedManifest(_$top)';

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
    s.writeln(writeTopBuilders());
    s.writeln(topCasts());
    s.writeln('}');
    return s.toString();
  }

  @visibleForTesting
  String writeTopBuilders() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(writeTopBuilderItem(item));
      s.writeln();
    }
    return s.toString();
  }

  @visibleForTesting
  String writeTopBuilderItem(ManifestItem item) {
    final s = StringBuffer();
    final methodName = item.name.toLowerStart();
    final fullName = '${manifest.name}${item.name}';
    s.writeln('static $fullName $methodName() => $fullName();');
    return s.toString();
  }

  @visibleForTesting
  String writeSubClass(ManifestItem item) {
    final s = StringBuffer();
    s.write('class ${manifest.name}${item.name} extends ${manifest.name}{');
    if (options.equality == SealedEquality.data) {
      s.writeln();
      s.writeln('@override');
      if (options.isNullSafe) {
        s.writeln('List<Object?> get props => [];');
      } else {
        s.writeln('List<Object> get props => [];');
      }
    }
    s.writeln('}');
    return s.toString();
  }
}
