import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/writer/backward_source_writer.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

class Source {
  final Options options;
  final Manifest manifest;

  const Source({
    required this.options,
    required this.manifest,
  });

  @override
  String toString() => 'Source{options: $options, manifest: $manifest}';

  String generate() {
    final s = StringBuffer();
    s.writeln(writeBackward(debug: true));
    s.writeln(generateTopClass());
    for (final item in manifest.items) {
      s.writeln(generateSubClass(item));
    }
    return s.toString();
  }

  @visibleForTesting
  String generateTopClass() {
    final s = StringBuffer();
    s.writeln('@SealedManifest(_${manifest.name})');
    s.write('abstract class ${manifest.name}');
    if (options.equality == SealedEquality.data) {
      s.write(' extends Equatable');
    }
    s.writeln('{');
    s.writeln(generateTopBuilders());
    s.writeln(generateTopCasts());
    s.writeln('}');
    return s.toString();
  }

  @visibleForTesting
  String generateTopBuilders() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(generateTopBuilderFor(item));
    }
    return s.toString();
  }

  @visibleForTesting
  String generateTopBuilderFor(ManifestItem item) {
    final s = StringBuffer();
    final methodName = item.name.toLowerStart();
    final fullName = '${manifest.name}${item.name}';
    s.writeln('static $fullName $methodName() => $fullName();');
    return s.toString();
  }

  @visibleForTesting
  String generateTopCasts() {
    final s = StringBuffer();
    for (final item in manifest.items) {
      s.writeln(generateTopCastsFor(item));
    }
    return s.toString();
  }

  @visibleForTesting
  String generateTopCastsFor(ManifestItem item) {
    final s = StringBuffer();
    final shortName = item.name;
    final fullName = '${manifest.name}${item.name}';
    s.writeln('bool is$shortName() => this is $fullName;');
    s.writeln();
    s.writeln('$fullName as$shortName() => this as $fullName;');
    s.writeln();
    s.write('$fullName');
    if (options.isNullSafe) {
      s.write('?');
    } else {
      s.write('/*?*/');
    }
    s.write('as${shortName}OrNull() => ');
    s.writeln('is$shortName() ? as$shortName() : null;');
    return s.toString();
  }

  @visibleForTesting
  String generateSubClass(ManifestItem item) {
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
