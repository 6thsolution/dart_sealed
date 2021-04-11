import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';

/// apply to manifest
@sealed
@immutable
class TypeOverriderDynamic {
  @visibleForTesting
  @nonVirtual
  final TypeOverrideDynamic override;

  const TypeOverriderDynamic(this.override);

  @visibleForTesting
  @nonVirtual
  bool isDynamic(ManifestType type) => type.name == 'dynamic';

  @visibleForTesting
  @nonVirtual
  ManifestField mapField(ManifestField field) => isDynamic(field.type)
      ? ManifestField(name: field.name, type: override.type)
      : field;

  @nonVirtual
  List<ManifestField> apply(List<ManifestField> fields) =>
      fields.map(mapField).toList();
}
