import 'package:sealed_generators/src/manifest/manifest.dart';

/// override types
class TypeOverride {
  const TypeOverride();
}

/// nothing to override
class TypeOverrideEmpty extends TypeOverride {
  const TypeOverrideEmpty();

  @override
  String toString() => 'TypeOverrideEmpty{}';
}

/// map all dynamic types
class TypeOverrideAllDynamic extends TypeOverride {
  final ManifestType type;

  const TypeOverrideAllDynamic(this.type);

  @override
  String toString() => 'TypeOverrideAllDynamic{type: $type}';
}

/// map field names to types
class TypeOverrideNamed extends TypeOverride {
  final Map<String, ManifestType> map;

  const TypeOverrideNamed(this.map);

  @override
  String toString() => 'TypeOverrideNamed{map: $map}';
}
