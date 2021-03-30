import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/backward/backward.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';

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
    s.writeln(backward(debug: true));
    s.writeln(generateTopClass());
    for (final item in manifest.items) {
      s.writeln(generateSubClass(item));
    }
    return s.toString();
  }

  @visibleForTesting
  String generateTopClass() {
    final s = StringBuffer();
    s.writeln('@SealedManifest(manifest: _${manifest.name})');
    s.write('abstract class ${manifest.name}');
    if (options.equality == SealedEquality.data) {
      s.write(' extends Equatable');
    }
    s.writeln('{');
    s.writeln('// ...');
    s.writeln('}');
    return s.toString();
  }

  @visibleForTesting
  String generateSubClass(ManifestItem item) {
    final s = StringBuffer();
    s.write('class ${manifest.name}${item.name} extends ${manifest.name}{');
    s.writeln('// ...');
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
