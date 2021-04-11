import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';

/// map field names to types
@sealed
@immutable
class TypeOverrideNamed {
  final Map<String, ManifestType> map;

  const TypeOverrideNamed({required this.map});

  @override
  String toString() => 'TypeOverrideNamed{map: $map}';
}
