import 'package:meta/meta_meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

/// annotate classes with @[Sealed] to generate sealed class code.
///
/// ==, hashCode and toString are generated for each data class.
/// [equality] will specify how equality is implemented.
/// see [SealedEquality] for further details.
///
/// annotated element should be an abstract private class without
/// any super class, mixin or interfaces except [Object]. it's name
/// without _ denotes generated sealed super abstract class name
/// and sub data classes name prefix.
///
/// all of the class methods are considered manifest for
/// sealed data sub classes. method names are transformed
/// to sub data class names. methods should only have positional
/// arguments with names becoming data class field names and
/// types becoming their types. types can be nullable.
///
/// each generated sealed abstract super class is annotated
/// with @[SealedManifest] targeting class which is annotated
/// by @Sealed. it prevents analyzer for complaining that the
/// class is unused.
///
/// if language level is before 2.12.0 all generated fields
/// are considered nullable.
///
/// for example:
/// ```dart
/// @Sealed()
/// abstract class _Weather {
///   void sunny();
///
///   void rainy(int rain);
///
///   void windy(double velocity, double? angle);
/// }
/// ```
@sealed
@Target({TargetKind.classType})
class Sealed {
  /// equality strategy
  final SealedEquality equality;

  @literal
  const Sealed({
    this.equality = SealedEquality.data,
  });

  @override
  String toString() => 'Sealed(equality: $equality)';
}

/// used to target @[Sealed] [manifest] class which
/// the code is generated for.
///
/// users should not use this annotation.
///
/// see: [Sealed]
@sealed
@Target({TargetKind.classType})
class SealedManifest {
  final Type manifest;

  @literal
  const SealedManifest(this.manifest);

  @override
  String toString() => 'SealedManifest(manifest: $manifest)';
}

/// used to override specified type.
/// this is needed when you are using one sealed generated type
/// in another.
///
/// if you don't specify field name then
/// all [dynamic] fields will be overridden.
/// if you specify a sealed type in another it will be
/// automatically dynamic.
///
/// see: [SealedType], [Sealed]
@sealed
@Target({TargetKind.method})
class SealedTypeOverride {
  /// map all dynamic types
  final SealedType? type;

  /// map field names to types
  final Map<String, SealedType>? map;

  @literal
  const SealedTypeOverride.named(Map<String, SealedType> map)
      // ignore: unnecessary_null_comparison
      : assert(map != null),
        map = map,
        type = null;

  @literal
  const SealedTypeOverride.allDynamic(SealedType type)
      // ignore: unnecessary_null_comparison
      : assert(type != null),
        map = null,
        type = type;

  @override
  String toString() => 'SealedTypeOverride(type: $type, map: $map)';
}

/// used to specify a type by it's name and nullability.
///
/// example: `SealedType.nonNull('Result<String, Exception)')`
///
/// see: [SealedTypeOverride], [Sealed]
@sealed
class SealedType {
  /// type name without any nullability suffix.
  final String name;

  /// whether type is nullable or not.
  final bool isNullable;

  /// nullable types.
  ///
  /// this SHOULD be used in legacy projects.
  @literal
  const SealedType.nullable(String name)
      : name = name,
        isNullable = true;

  /// non-nullable types.
  ///
  /// this can NOT be used in legacy projects.
  @literal
  @literal
  const SealedType.nonNull(String name)
      : name = name,
        isNullable = false;

  @override
  String toString() =>
      'SealedTypeOverride(name: $name, isNullable: $isNullable)';
}

/// different equality (and hash code) implementations
/// for generated data classes.
enum SealedEquality {
  /// equality is implemented with Equatable package.
  /// it behaves like kotlin data classes.
  data,

  /// only identical instances are equal.
  /// it's like when you don't implement any specific equality.
  ///
  /// note: if you use this please be aware of const constructors.
  identity,

  /// all of the instances are not equal.
  /// even some instance is not equal with itself.
  distinct,
}
