/// annotations for sealed_annotations
library sealed_annotations_annotations;

import 'package:meta/meta_meta.dart';

/// annotate classes with @[Sealed] to generate sealed class code.
///
/// ==, hashCode and toString are generated for each data class.
/// equality will specify how equality is implemented.
/// see [Equality] and [WithEquality] if you want to override equality
/// for all sub classes or only a specified group.
/// by default all equalities are [Equality.data].
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
/// Top class name is derived from manifest class name and it
/// will be also used as sub class name prefixes. You can not
/// override top class name but you can override prefix for all
/// sub classes by using [WithPrefix] and override full sub class
/// names by using [WithName]. For example annotate top class by
/// `@WithPrefix('')` to remove prefix generation.
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
@Target({TargetKind.classType})
class Sealed {
  const Sealed();

  @override
  String toString() => 'Sealed()';
}

/// used to target @[Sealed] [manifest] class which
/// the code is generated for.
///
/// users should NOT use this annotation.
///
/// see: [Sealed]
@Target({TargetKind.classType})
class SealedManifest {
  final Type manifest;

  const SealedManifest(this.manifest);

  @override
  String toString() => 'SealedManifest(manifest: $manifest)';
}

/// Override type of a field in a data class.
/// The regular specified type has no effect so it's better
/// not to specify it.
///
/// this is needed when you are using one sealed generated type
/// in another.
///
/// This can be applied only to method arguments.
///
/// for example:
/// ```dart
/// @Sealed(equality: Equality.data)
/// abstract class _Weather {
///   void rainy(@WithType('int') rain);
/// }
/// ```
@Target({TargetKind.parameter})
class WithType {
  /// type name.
  /// for example "int?", "double" or "Result<WeatherData>".
  final String type;

  const WithType(this.type);

  @override
  String toString() => 'WithType(type: $type)';
}

/// Override generated sub class names.
///
/// If applied to sub classes it will change
/// the specified sub class full name.
///
/// This can not be applied to top class.
///
/// for example:
/// ```dart
/// abstract class _Weather { // will become Weather
///   void sunny(); // will become WeatherSunny
///
///   @WithName('Hello')
///   void rainy(int rain); // will become Hello
/// }
/// ```
@Target({TargetKind.method})
class WithName {
  /// name.
  ///
  /// If applied to sub classes it will change
  /// the specified sub class full name.
  final String name;

  const WithName(this.name);

  @override
  String toString() => 'WithName(name: $name)';
}

/// Override prefix in generated class names.
///
/// If applied to top class it will change prefix names for all
/// sub classes.
///
/// This can not be applied to sub classes.
///
/// for example:
/// ```dart
/// @WithPrefix('Lollipop')
/// abstract class _Weather { // will become Weather
///   void sunny(); // will become LollipopSunny
///
///   void rainy(int rain); // will become LollipopRainy
/// }
/// ```
@Target({TargetKind.classType})
class WithPrefix {
  /// prefix.
  ///
  /// If applied to top class it will change prefix names for all
  /// sub classes.
  final String prefix;

  const WithPrefix(this.prefix);

  @override
  String toString() => 'WithPrefix(prefix: $prefix)';
}

/// Override equality in generated classes.
///
/// If applied to top class it will change equality for all
/// sub classes.
///
/// If applied to a sub class it will change equality for the
/// specified sub class.
///
/// This can be applied to both sub classes and top class.
///
/// Sub class equality will be based on top
/// class equality if [equality] is not specified.
/// By default top class equality is [Equality.data].
///
/// for example:
/// ```dart
/// @WithPrefix('Lollipop')
/// abstract class _Weather { // will become Weather
///   void sunny(); // will become LollipopSunny
///
///   void rainy(int rain); // will become LollipopRainy
/// }
/// ```
@Target({TargetKind.classType, TargetKind.method})
class WithEquality {
  /// equality.
  ///
  /// If applied to top class it will change equality for all
  /// sub classes.
  ///
  /// If applied to a sub class it will change equality for the
  /// specified sub class.
  final Equality equality;

  const WithEquality(this.equality);

  @override
  String toString() => 'WithEquality(equality: $equality)';
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
