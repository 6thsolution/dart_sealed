import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';

@sealed
@immutable
class OverrideNamedLegacyFixer {
  const OverrideNamedLegacyFixer();

  @nonVirtual
  TypeOverrideNamed fix(TypeOverrideNamed override) => TypeOverrideNamed(
        map: override.map.map(
          (field, type) => MapEntry(
            field,
            ManifestType(
              name: type.name,
              isNullable: true,
            ),
          ),
        ),
      );
}
