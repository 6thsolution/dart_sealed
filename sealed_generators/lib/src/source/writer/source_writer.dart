import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward_source_writer.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

extension SourceWriter on Source {
  /// nullability suffix: "?" or "/*?*/"
  @visibleForTesting
  String get n => options.isNullSafe ? '?' : '/*?*/';

  /// non-nullability suffix: "" or "/*!*/"
  @visibleForTesting
  String get nn => options.isNullSafe ? '' : '/*!*/';

  /// subclass name
  @visibleForTesting
  String name(ManifestItem item) => manifest.name + item.name;

  /// ex. isRainy()
  @visibleForTesting
  String topCastIsItem(ManifestItem item) =>
      'bool is${item.name}() => this is ${name(item)};';

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
      '${name(item)}$nn as${item.name}() =>'
      ' this as ${name(item)};';

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
      '${name(item)}$n as${item.name}OrNull() => '
      ' this is ${name(item)} ? this as ${name(item)} : null;';

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

  // **** //

  String write() {
    final s = StringBuffer();
    s.writeln(writeBackward(debug: true));
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
    s.writeln('@SealedManifest(_${manifest.name})');
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
