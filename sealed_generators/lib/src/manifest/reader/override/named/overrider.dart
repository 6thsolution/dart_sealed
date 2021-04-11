import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';

/// apply to manifest
@sealed
@immutable
class TypeOverriderNamed {
  @visibleForTesting
  final TypeOverrideNamed override;

  const TypeOverriderNamed(this.override);

  ManifestField _mapField(ManifestField field) {
    final name = field.name;
    final overrideType = override.map[name];
    return overrideType != null
        ? ManifestField(name: name, type: overrideType)
        : field;
  }

  List<ManifestField> apply(List<ManifestField> fields) =>
      fields.map(_mapField).toList();
}
