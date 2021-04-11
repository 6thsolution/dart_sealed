import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';

@sealed
@immutable
class OverrideDynamicLegacyFixer {
  const OverrideDynamicLegacyFixer();

  @nonVirtual
  TypeOverrideDynamic fix(TypeOverrideDynamic override) => TypeOverrideDynamic(
        type: ManifestType(
          name: override.type.name,
          isNullable: true,
        ),
      );
}
