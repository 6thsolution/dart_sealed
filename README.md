# Dart Sealed Class Generator

[![Dart](https://img.shields.io/github/workflow/status/6thsolution/dart_sealed/Dart?label=build)](https://github.com/6thsolution/dart_sealed/actions/workflows/dart.yml)
[![Pub](https://img.shields.io/pub/v/sealed_generators.svg?color=blue&label=sealed_generators)](https://pub.dev/packages/sealed_generators)
[![Pub](https://img.shields.io/pub/v/sealed_annotations.svg?color=blue&label=sealed_annotations)](https://pub.dev/packages/sealed_annotations)

Generate sealed class hierarchy for Dart and Flutter, For null-safe and legacy projects.

## Features

* Generate sealed class with abstract super type and data sub classes.
* Static factory methods. for example `Result.success(data: 0)`.
* Cast methods. for example `a.asSuccess`, `a.isSuccess` or `a.isSuccessOrNull`.
* Three types of equality and hashCode generation : data (like kotlin data classes), identity and distinct.
* Implement data equality with popular equatable library.
* Support for generics. even types can be mixed.
* Support for nullable and non-nullable types in null-safe projects.
* Support for using one sealed type in another.
* Support both legacy and null-safe projects.
* Generate nullability comments for legacy projects to ease your migration.
* Generate toString for data classes.
* Generate 9 types of different matching methods. like `when` or `whenOrElse`.

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

You can choose between three types of equality using `equality` parameter of `@Sealed(equality: SealedEquality.*)`
annotations. Default equality is `data`.

* `data` Equality is implemented with Equatable package. It behaves like kotlin data classes.
* `identity` Only identical instances are equal. It's like when you don't implement any specific equality.
* `distinct` All the instances are not equal with each other. Even an instance is not equal with itself.

```dart
@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
```

Note that you can have nullable and non-nullable fields. In legacy projects all fields are considered nullable.

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

  void branch({
    required void Function(WeatherSunny sunny) sunny,
    required void Function(WeatherRainy rainy) rainy,
    required void Function(WeatherWindy windy) windy,
  }) {
    /* ... */
  }

  void branchPartial({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
  }) {
    /* ... */
  }

  void branchOrElse({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
    required void Function(Weather weather) orElse,
  }) {
    /* ... */
  }

  void branchOrThrow({
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
  String toString() => 'Weather.Rainy(rain: $rain)';

  @override
  List<Object?> get props => [rain];
}

class WeatherWindy extends Weather {
  /* ... */
}
```

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

## Using one sealed type in another

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

You have two options:

First you can override all dynamic types for a method. like:

```dart
@Sealed()
abstract class _WeatherInfo {

// instead of `dynamic result` you can also use
// `Result<WeatherData> result` and even not
// specify types.

  @SealedOverrideDynamic('Result<WeatherData>')
  void fromInternet(dynamic result);
}
```

First you can override types by field names for a method. This way you can override multiple types. like:

```dart
@Sealed()
abstract class _WeatherInfo {

// instead of `dynamic result` you can also use
// `Result<WeatherData> result` and even not
// specify types.

  @SealedOverrideNamed({'result': 'Result<WeatherData>'})
  void fromInternet(dynamic result);
}
```
