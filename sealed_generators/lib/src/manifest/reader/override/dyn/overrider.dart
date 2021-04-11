import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';

/// apply to manifest
@sealed
@immutable
class TypeOverriderDynamic {
  @visibleForTesting
  final TypeOverrideDynamic override;

  const TypeOverriderDynamic(this.override);

  bool _isDynamic(ManifestType type) => type.name == 'dynamic';

  ManifestField _mapField(ManifestField field) => _isDynamic(field.type)
      ? ManifestField(name: field.name, type: override.type)
      : field;

  List<ManifestField> apply(List<ManifestField> fields) =>
      fields.map(_mapField).toList();
}
