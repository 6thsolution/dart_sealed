# Dart Sealed Class Generator

[![build](https://img.shields.io/github/workflow/status/6thsolution/dart_sealed/Dart?label=build)](https://github.com/6thsolution/dart_sealed/actions/workflows/dart.yml)
[![build](https://img.shields.io/codecov/c/gh/6thsolution/dart_sealed?label=coverage)](https://codecov.io/gh/6thsolution/dart_sealed)
[![pub](https://img.shields.io/pub/v/sealed_annotations.svg?color=blue&label=sealed_annotations)](https://pub.dev/packages/sealed_annotations)
[![pub](https://img.shields.io/pub/v/sealed_generators.svg?color=blue&label=sealed_generators)](https://pub.dev/packages/sealed_generators)
[![pub](https://img.shields.io/pub/v/sealed_writer.svg?color=blue&label=sealed_writer)](https://pub.dev/packages/sealed_writer)
[![pub](https://img.shields.io/pub/v/super_enum_sealed_annotations.svg?color=blue&label=super_enum_sealed_annotations)](https://pub.dev/packages/super_enum_sealed_annotations)
[![pub](https://img.shields.io/pub/v/super_enum_sealed_generators.svg?color=blue&label=super_enum_sealed_generators)](https://pub.dev/packages/super_enum_sealed_generators)

Generate sealed class hierarchy for Dart and Flutter, For null-safe and legacy projects.

## Features

* Generate sealed class with abstract super type and data sub classes.
* Static factory methods. for example `Result.success(data: 0)`.
* Cast methods. for example `a.asSuccess()`, `a.isSuccess()` or `a.asSuccessOrNull()`.
* Three types of equality and hashCode generation : data (like kotlin data classes), identity and distinct.
* Implement data equality with popular equatable library.
* Support for generics. even types can be mixed.
* Support for nullable and non-nullable types in null-safe projects.
* Support for using one sealed type in another.
* Support both legacy and null-safe projects.
* Generate nullability comments for legacy projects to ease your migration.
* Generate toString for data classes.
* Generate 6 types of different matching methods. like `when` or `whenOrElse`.
* Support for automatic unwrapping and Inheritance

## Usage

Add dependencies in your `pubspec.yaml` file.

```yaml
dependencies:
  sealed_annotations: ^latest.version

dev_dependencies:
  sealed_generators: ^latest.version
```

Import `sealed_annotations`.

```dart
import 'package:sealed_annotations/sealed_annotations.dart';
```

Add `part` pointing to a file which you want classes be generated in. with `.super.dart` extension.

```dart
part 'weather.sealed.dart';
```

Add `@Sealed` annotation, and an abstract private class as a manifest for generated code.

You can choose between three types of equality using `@WithEquality(...)` annotation. Default equality is `data` if not
specified. This will become default equality for all sub classes. You can change equality of each sub class by using
this annotation on individual methods.

Equality types:

* `data` Equality is implemented with Equatable package. It behaves like kotlin data classes.
* `identity` Only identical instances are equal. It's like when you don't implement any specific equality.
* `distinct` All the instances are not equal with each other. Even an instance is not equal with itself.

A basic example:

```dart
@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
```

In the proceeding example all classes will have `data` equality. For example if you wanted `identity` equality for all
classes but using `distinct` equality for `windy`:

```dart
@Sealed()
@WithEquality(Equality.identity)
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  @WithEquality(Equality.distinct)
  void windy(double velocity, double? angle);
}
```

An abstract super class is generated with name equal to name of manifest class without the underline (here `Weather`).
Each method will become a sub class. There should be at least one method. Sub class names are based on method name
prefixed with super class name (for example `WeatherSunny`). Naming process can be tailored with use of `@WithPrefix`
and `@WithName` annotations. Each method argument will become a field in corresponding sub class. Field names are equal
to argument names and field types are equal to argument types or dynamic if not specified. Argument types can be
overridden using `@WithType` annotation for example when type information is not available at build time. Note that you
can have nullable and non-nullable fields. In legacy projects all fields are considered nullable.

To change prefix of sub class names which by default is top class name, you can use `@WithPrefix` annotation. for
example:

```dart
@Sealed()
@WithPrefix('Hello')
abstract class _Weather {
  void sunny();
}
```

Now `sunny` will be named `HelloSunny` instead of the default `WeatherSunny`. You can use `@WithPrefix('')` to remove
all prefix from sub class names.

To change sub class names directly you can use `@WithName` annotation. It will override `WithPrefix` if specified. for
example:

```dart
@Sealed()
abstract class _Weather {
  @WithName('Hello')
  void sunny();
}
```

Now `sunny` will be named `Hello` instead of the default `WeatherSunny`. This is use full if you want not to use prefix
for some items.

Almost all methods on sealed classes use short names extracted from manifest method names. Full sub class names are not
used. It is recommended not to use sub classes directly. There are factory methods for each item on super class.

Then run the following command to generate code for you.

```bash
dart run build_runner build
```

The generated code will look like: (the following code is summarised)

```dart
abstract class Weather {
  static WeatherRainy rainy({required int rain}) =>
      WeatherRainy(rain: rain);

  bool isRainy() => this is WeatherRainy;

  WeatherRainy asRainy() => this as WeatherRainy;

  WeatherRainy? asRainyOrNull() {
    /* ... */
  }

  /* ... */

  R when<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(WeatherRainy rainy) rainy,
    required R Function(WeatherWindy windy) windy,
  }) {
    /* ... */
  }

  R whenOrElse<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    /* ... */
  }

  R whenOrDefault<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R orDefault,
  }) {
    /* ... */
  }

  R? whenOrNull<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
  }) {
    /* ... */
  }

  R whenOrThrow<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
  }) {
    /* ... */
  }

  void whenPartial({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
  }) {
    /* ... */
  }
}

class WeatherSunny extends Weather {
  /* ... */
}

class WeatherRainy extends Weather with EquatableMixin {
  WeatherRainy({required this.rain});

  final int rain;

  WeatherRainy copy({int? rain}) =>
      WeatherRainy(rain: rain ?? this.rain);

  @override
  String toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object?> get props => [rain];
}

class WeatherWindy extends Weather {
  /* ... */
}
```

Notes:

- Always use exact match method that you need, for example do not use `whenOrNull` instead of `whenPartial`.
- Prefer using factories in super class instead of sub class constructors.
- Minimize usage of cast methods, most of the time they can be replaced with a match method.

## Generic Usage

For generic sealed classes you should write manifest class like a generic class which you are implementing.

It is recommended that if you want nullable generic fields, declare a generic parameter as `T extends Base?` and use `T`
without nullability suffix. If you want non-nullable generic fields declare a generic parameter as `T extends Base` and
use `T` without nullability suffix. If you don't specify upper bound it will default to `Object?` so your generic types
will be nullable.

```dart
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result.sealed.dart';

@Sealed()
abstract class _Result<D extends num> {
  void success(D data);

  void error(Object exception);
}
```

Or you can have multiple generic types and even mix them.

```dart
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result.sealed.dart';

@Sealed()
abstract class _Result<D extends num, E extends Object> {
  void success(D data);

  void error(E exception);

  void mixed(D data, E exception);
}
```

## Wrapping and Inheritance

There are times when you are using a sealed type only to wrap some fields and then unwrap it by using match functions in
for example your blocs. In these situations it is better for the sealed sub class not to appear explicitly.

for example suppose the following manifest:

```dart
@Sealed()
abstract class State {
  void initial();

  void loading();

  void data(Object obj);
}
```

when you want to apply `when` on that it will look like:

```dart
Object doTest(State s) {
  return s.when(
    initial: (initial) => 'something',
    loading: (loading) => 'other thing',
    data: (data) => 'data ${data.obj}',
  );
}
```

as you see you even don't need `initial` or `loading` values, and even you only need `data` value to extract `obj` from
it.

You can use `@WithWrap()` annotation:

```dart
@Sealed()
@WithWrap()
abstract class State {
  void initial();

  void loading();

  void data(Object obj);
}
```

Then your match functions will look like this:

```dart
Object doTest(State s) {
  return s.when(
    initial: () => 'something',
    loading: () => 'other thing',
    data: (obj) => 'data $obj',
  );
}
```

As you see it automatically unwraps values for you. If you add `@WithWrap()` on class it will apply to all sub classes.
If you want wrapping only for some of your sub classes apply them to methods. for example:

```dart
@Sealed()
abstract class State {
  @WithWrap()
  void initial();

  @WithWrap()
  void loading();

  void data(Object obj);
}
```

In previous example `data` will not be automatically unwrapped.

Also, when making a sealed sub class wrapped, its constructor and the corresponding factory in sealed super class will
be using positional arguments instead of named arguments. For example for `data`:

```dart
// when not wrapped:
final d1 = State.data(obj: 'hello');

// when wrapped:
final d2 = State.data('hello');
```

## Dynamic types and Using one sealed type in another

Consider you have a sealed result type like:

```dart
@Sealed()
abstract class _Result<D extends Object> {
  /* ... */
}
```

You want to use this type in another sealed type.

```dart
@Sealed()
abstract class _WeatherInfo {
  void fromInternet(Result<WeatherData> result);
}
```

If you generate for `WeatherInfo` you will see that result has `dynamic` type. It is because `Result` itself is not code
generated at build time.

You should use `@WithType` annotation.

```dart
@Sealed()
abstract class _WeatherInfo {
  void fromInternet(@WithType('Result<WeatherData>') result);

  // you can also have nullable types.
  void nullable(@WithType('Result<WeatherData>?') result);
}
```

## super_enum compatible API

You can use `super_enum_sealed_annotations` and `super_enum_sealed_generators` instead of `super_enum`
and `super_enum_generator`. It has all features of `super_enum` and `dart_sealed` instead of `@WithType` for dynamic
types. Also, it can be used in legacy and null-safe projects. Apart from changing dependencies, you should only change
import of `super_enum` to `super_enum_sealed_annotations`. Some other changes may be needed for your code.

For more information check `super_enum` documentation:
[super_enum](https://pub.dev/packages/super_enum)

### migrating from super_enum

If you were using super_enum and now you want to change your dependency to dart_sealed:

* Change dependency of `super_enum` with `super_enum_sealed_annotations`.
* Add dependency to `sealed_annotations`.
* Change dependency of `super_enum_generator` with `super_enum_sealed_generators`.
* Add dev dependency to `sealed_generators`.
* Change imports of `super_enum` with `super_enum_sealed_annotations`.
* Run `dart run build_runner build`.
* Now instead of super_enum, our library will generate code for you in `.super` files. Apart from generated sealed
  classes some comments are generated for guiding you through migration and a commented manifest class with `@Sealed`
  annotation, and the same name of your enum.
* Here you may have some conflicts in your code which should be fixed.
* Uncomment and replace generated manifest class (which has `@Sealed` annotation) with your `@super_enum` annotated
  enum. Then if your project is null-safe start changing nullability of each field according to your needs. In legacy
  projects are fields are considered nullable, but if you like, you can change nullability docs to ease you when
  migrating to null-safety. If your sealed class is generic change `Generic` type argument name and if it is needed to
  use multiple type arguments. Most of the time `@WithEquality` and `@WithName` are not needed, but they will be
  generated automatically. You can remove or change them according to your needs.
* Change imports of `super_enum_sealed_annotations` with `sealed_annotations`.
* Change `part` suffixes from `.super` to `.sealed`.
* Run `dart run build_runner build`.
* Remove `.super` files if it is not removed automatically.
* Remove dependency of `super_enum_sealed_annotations`.
* Remove dependency of `super_enum_sealed_generators`.
* Optional: If you want to migrate your code to null-safety you should do it now using standard migration tool. Then
  run `dart run build_runner build` again and this library will handle it for you.

For example for:

```
@superEnum
enum _Weather {
  @object
  Sunny,
  @Data(fields: [
    DataField<int>('rain'),
  ])
  Rainy,
  @Data(fields: [
    DataField<double>('velocity'),
    DataField<double>('angle', required: false),
  ])
  Windy,
}
```

It will generate sealed classes and the following manifest class.

```dart
@Sealed()
abstract class _Weather$ {
  @WithEquality(Equality.data)
  @WithName('Sunny')
  void sunny();

  @WithEquality(Equality.data)
  @WithName('Rainy')
  void rainy(int rain);

  @WithEquality(Equality.data)
  @WithName('Windy')
  void windy(double velocity, double? angle);
}
```

## Migrating to null-safety

Using library for legacy projects it will generate legacy code assuming all fields being nullable. It also adds
nullability comments for easing migration.

For migration use standard migration tool. Change nullability of sealed class fields (which is mapped from method
arguments of manifest class) according to your needs. run `dart run build_runner build` again and library will generate
null-safe code for you.
