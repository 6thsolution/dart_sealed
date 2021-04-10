import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/type_override.dart';
import 'package:source_gen/source_gen.dart';

/// apply to manifest
class TypeOverrideReader {
  static const String annotationTypeName = 'SealedOverride';

  const TypeOverrideReader();

  TypeOverride read(MethodElement method) {
    final annotation = _readOverrideAnnotationOrNull(method);
    if (annotation == null) {
      return TypeOverrideEmpty();
    } else {
      final type = _readType(annotation.read('type'));
      final map = _readMap(annotation.read('map'));
      if (map != null && type == null) {
        return TypeOverrideNamed(map);
      } else if (map == null && type != null) {
        return TypeOverrideAllDynamic(type);
      } else {
        throw AssertionError();
      }
    }
  }

  ConstantReader? _readOverrideAnnotationOrNull(MethodElement method) {
    final annotations = method.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) =>
              e?.type?.getDisplayString(withNullability: false) ==
              annotationTypeName,
        )
        .map((e) => ConstantReader(e))
        .toList();
    return annotations.isNotEmpty ? annotations.first : null;
  }

  Map<String, ManifestType>? _readMap(ConstantReader reader) {
    if (reader.isNull) {
      return null;
    } else {
      final map = reader.mapValue;
      final out = <String, ManifestType>{};
      for (final e in map.entries) {
        final field = e.key!.toStringValue()!;
        final type = _readType(ConstantReader(e.value))!;
        out[field] = type;
      }
      return out;
    }
  }

  ManifestType? _readType(ConstantReader reader) {
    if (reader.isNull) {
      return null;
    } else {
      final name = reader.read('name').stringValue;
      final isNullable = reader.read('isNullable').boolValue;
      return ManifestType(name: name, isNullable: isNullable);
    }
  }
}
