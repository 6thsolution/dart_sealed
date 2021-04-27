/// annotations for sealed_annotations
library sealed_annotations_annotations;

import 'package:meta/meta_meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

/// annotate classes with @[Sealed] to generate sealed class code.
///
/// ==, hashCode and toString are generated for each data class.
/// [equality] will specify how equality is implemented.
/// see [Equality] for further details.
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
  final Equality equality;

  @literal
  const Sealed({
    this.equality = Equality.data,
  });

  @override
  String toString() => 'Sealed(equality: $equality)';
}

/// used to target @[Sealed] [manifest] class which
/// the code is generated for.
///
/// users should NOT use this annotation.
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

/// Override generated class name and
/// equality for each item.
///
/// for example:
/// ```dart
/// @Sealed(equality: Equality.data)
/// abstract class _Weather {
///   void sunny();
///
///   @Meta(name: 'BadWeather', equality: Equality.distinct)
///   void rainy(int rain);
/// }
/// ```
@sealed
@Target({TargetKind.method})
class Meta {
  /// override generated class name.
  ///
  /// generated class will be
  /// (manifest class name + item name)
  /// [name] is not specified.
  final String? name;

  /// override equality for each item.
  ///
  /// item equality will be based on manifest
  /// class equality if [equality] is not specified.
  final Equality? equality;

  @literal
  const Meta({
    this.name,
    this.equality,
  });

  @override
  String toString() => 'Meta(name: $name, equality: $equality)';
}

/// Override type of a field in a data class.
/// The regular specified type has no effect so it's better
/// not to specify it.
///
/// this is needed when you are using one sealed generated type
/// in another.
///
/// for example:
/// ```dart
/// @Sealed(equality: Equality.data)
/// abstract class _Weather {
///   void rainy(@WithType('int') rain);
/// }
/// ```
@sealed
@Target({TargetKind.parameter})
class WithType {
  /// type name.
  /// for example "int?", "double" or "Result<WeatherData>".
  ///
  /// all types will be nullable in legacy projects.
  final String type;

  @literal
  const WithType(this.type);

  @override
  String toString() => 'WithType(type: $type)';
}

/// different equality (and hash code) implementations
/// for generated data classes.
enum Equality {
  /// equality is implemented with Equatable package.
  /// it behaves like kotlin data classes.
  data,

  /// only identical instances are equal.
  /// it's like when you don't implement any specific equality.
  ///
  /// note: if you use this please be aware of const constructors.
  identity,

  /// all of the instances are not equal.
  /// even an instance is not equal with itself.
  distinct,
}
