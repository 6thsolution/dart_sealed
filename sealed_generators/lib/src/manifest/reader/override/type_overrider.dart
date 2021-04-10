import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/type_override.dart';

/// apply to manifest
class TypeOverrider {
  const TypeOverrider();

  List<ManifestField> apply(
    TypeOverride override,
    List<ManifestField> fields,
  ) =>
      override is TypeOverrideEmpty ? fields : _mapFields(override, fields);

  bool _isDynamic(ManifestType type) => type.name == 'dynamic';

  List<ManifestField> _mapFields(
    TypeOverride override,
    List<ManifestField> fields,
  ) =>
      fields.map((field) => _mapField(override, field)).toList();

  ManifestField _mapField(
    TypeOverride override,
    ManifestField field,
  ) {
    if (override is TypeOverrideEmpty) {
      return field;
    } else if (override is TypeOverrideAllDynamic) {
      final name = field.name;
      final type = field.type;
      final overrideType = override.type;
      return _isDynamic(type)
          ? ManifestField(name: name, type: overrideType)
          : field;
    } else if (override is TypeOverrideNamed) {
      final name = field.name;
      final overrideMap = override.map;
      final overrideType = overrideMap[name];
      return overrideType != null
          ? ManifestField(name: name, type: overrideType)
          : field;
    } else {
      throw AssertionError();
    }
  }
}
