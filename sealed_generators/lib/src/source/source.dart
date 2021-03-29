import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';

class Source {
  final Options options;
  final Manifest manifest;

  const Source({
    required this.options,
    required this.manifest,
  });

  Future<String> generate() async {
    return '// todo';
  }

  @override
  String toString() => 'Source{options: $options, manifest: $manifest}';
}
