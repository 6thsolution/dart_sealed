# Dart Sealed Class Generator

[![build](https://img.shields.io/github/workflow/status/6thsolution/dart_sealed/Dart?label=build)](https://github.com/6thsolution/dart_sealed/actions/workflows/dart.yml)
[![build](https://img.shields.io/codecov/c/gh/6thsolution/dart_sealed?label=coverage)](https://codecov.io/gh/6thsolution/dart_sealed)
[![pub](https://img.shields.io/pub/v/sealed_annotations.svg?color=blue&label=sealed_annotations)](https://pub.dev/packages/sealed_annotations)
[![pub](https://img.shields.io/pub/v/sealed_generators.svg?color=blue&label=sealed_generators)](https://pub.dev/packages/sealed_generators)
[![pub](https://img.shields.io/pub/v/sealed_writer.svg?color=blue&label=sealed_writer)](https://pub.dev/packages/sealed_writer)

Generate sealed class hierarchy for Dart and Flutter.

## Features

* Generate sealed class with abstract super type and data sub-classes.
* Static factory methods. for example `Result.success(data: 0)`.
* Cast methods. for example `a.asSuccess`, `a.isSuccess` or `a.asSuccessOrNull`.
* Three types of equality and hashCode generation : data (like kotlin data classes), identity and distinct.
* Implement data equality with popular equatable library.
* Support for generics. even types can be mixed.
* Support for nullable and non-nullable types in null-safe projects.
* Support for using one sealed type in another.
* Support for null-safety.
* Generate toString for data classes.
* Generate 6 types of different matching methods. like `when`, `maybeWhen` and `map`.

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

Add `part` pointing to a file which you want classes be generated in. with `.sealed.dart` extension.

```dart
part 'weather.sealed.dart';
```

Add `@Sealed` annotation, and an abstract private class as a manifest for generated code. For example:

```dart
@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
```

Then run the following command to generate code for you. If you are developer for flutter:

```bash
flutter pub run build_runner build
```

And if you are developing for pure dart:

```bash
dart run build_runner build
```

The generated code will look like: (the following code is summarised)

```dart
abstract class Weather {
  const factory Weather.rainy({required int rain}) = WeatherRainy;

  bool get isRainy => this is WeatherRainy;

  WeatherRainy get asRainy => this as WeatherRainy;

  WeatherRainy? get asRainyOrNull {
    /* ... */
  }

  /* ... */

  R when<R extends Object?>({
    required R Function() sunny,
    required R Function(int rain) rainy,
    required R Function(double velocity, double? angle) windy,
  }) {
    /* ... */
  }

  R maybeWhen<R extends Object?>({
    R Function()? sunny,
    R Function(int rain)? rainy,
    R Function(double velocity, double? angle)? windy,
    required R Function(Weather weather) orElse,
  }) {
    /* ... */
  }

  void partialWhen({
    void Function()? sunny,
    void Function(int rain)? rainy,
    void Function(double velocity, double? angle)? windy,
    void Function(Weather weather)? orElse,
  }) {
    /* ... */
  }

  R map<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(WeatherRainy rainy) rainy,
    required R Function(WeatherWindy windy) windy,
  }) {
    /* ... */
  }

  R maybeMap<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    /* ... */
  }

  void partialMap({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
    void Function(Weather weather)? orElse,
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

- Prefer using factories in super class instead of sub-class constructors. like `Whether.rainy()` instead
  of `WhetherRainy()`
- Minimize usage of cast methods, most of the time they can be replaced with a match method.

## Equality and generated class names

You can choose between three types of equality using `@WithEquality(...)` annotation. Default equality is `data` if not
specified. This will become default equality for all sub-classes. You can change equality of each sub-class by using
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
Each method will become a sub-class. There should be at least one method. sub-class names are based on method name
prefixed with super class name (for example `WeatherSunny`). Naming process can be tailored with use of `@WithPrefix`
and `@WithName` annotations. Each method argument will become a field in corresponding sub-class. Field names are equal
to argument names and field types are equal to argument types or dynamic if not specified. Argument types can be
overridden using `@WithType` annotation for example when type information is not available at build time. Note that you
can have nullable and non-nullable fields.

To change prefix of sub-class names which by default is top class name, you can use `@WithPrefix` annotation. for
example:

```dart
@Sealed()
@WithPrefix('Hello')
abstract class _Weather {
  void sunny();
}
```

Now `sunny` will be named `HelloSunny` instead of the default `WeatherSunny`. You can use `@WithPrefix('')` to remove
all prefix from sub-class names.

To change sub-class names directly you can use `@WithName` annotation. It will override `WithPrefix` if specified. for
example:

```dart
@Sealed()
abstract class _Weather {
  @WithName('Hello')
  void sunny();
}
```

Now `sunny` will be named `Hello` instead of the default `WeatherSunny`. This is useful if you want not to use prefix
for some items.

Almost all methods on sealed classes use short names extracted from manifest method names. Full sub-class names are not
used. It is recommended not to use sub-classes directly. There are factory methods for each item on super class.

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

## Ignoring Generated Files

It is recommended to ignore generated files on Git. Add this to your `.gitignore` file:

```
*.sealed.dart
```

It is NOT recommended to exclude generated files from analysis. But if you decide to do so, add this to
your `analysis_options.yaml` file:

```
analyzer:
  exclude:
    - **.sealed.dart
```
