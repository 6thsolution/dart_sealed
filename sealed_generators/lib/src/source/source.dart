import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';

@immutable
@sealed
class Source {
  final Options options;
  final Manifest manifest;

  const Source({
    required this.options,
    required this.manifest,
  });

  @override
  String toString() => 'Source{options: $options, manifest: $manifest}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Source &&
          runtimeType == other.runtimeType &&
          options == other.options &&
          manifest == other.manifest;

  @override
  int get hashCode =>
      runtimeType.hashCode ^ options.hashCode ^ manifest.hashCode;
}
