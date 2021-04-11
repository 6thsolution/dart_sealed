import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';

/// map all dynamic types
@sealed
@immutable
class TypeOverrideDynamic {
  final ManifestType type;

  const TypeOverrideDynamic({required this.type});

  @override
  String toString() => 'TypeOverrideDynamic{type: $type}';
}
