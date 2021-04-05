// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_nullsafe_data_named_args.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: null-safe
// no params identified.
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: null-safe
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Weather$ {
  void sunny();

  void rainy(int rain);

  void windy(
    double velocity,
    double? angle,
  );
}
// **************************************************************************

@SealedManifest(_Weather)
abstract class Weather extends Equatable {
  @factory
  static WeatherSunny sunny() => WeatherSunny();

  @factory
  static WeatherRainy rainy({required int rain}) => WeatherRainy(rain: rain);

  @factory
  static WeatherWindy windy({
    required double velocity,
    required double? angle,
  }) =>
      WeatherWindy(
        velocity: velocity,
        angle: angle,
      );

  bool isSunny() => this is WeatherSunny;

  bool isRainy() => this is WeatherRainy;

  bool isWindy() => this is WeatherWindy;

  WeatherSunny asSunny() => this as WeatherSunny;

  WeatherRainy asRainy() => this as WeatherRainy;

  WeatherWindy asWindy() => this as WeatherWindy;

  WeatherSunny? asSunnyOrNull() =>
      this is WeatherSunny ? this as WeatherSunny : null;

  WeatherRainy? asRainyOrNull() =>
      this is WeatherRainy ? this as WeatherRainy : null;

  WeatherWindy? asWindyOrNull() =>
      this is WeatherWindy ? this as WeatherWindy : null;

  R when<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(WeatherRainy rainy) rainy,
    required R Function(WeatherWindy windy) windy,
  }) {
    throw 0;
  }

  R whenOrElse<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    throw 0;
  }
}

class WeatherSunny extends Weather {
  WeatherSunny();

  @factory
  WeatherSunny copy() => WeatherSunny();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

class WeatherRainy extends Weather {
  WeatherRainy({required this.rain});

  final int rain;

  @factory
  WeatherRainy copy({int? rain}) => WeatherRainy(rain: rain ?? this.rain);

  @override
  String toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object?> get props => [rain];
}

class WeatherWindy extends Weather {
  WeatherWindy({
    required this.velocity,
    required this.angle,
  });

  final double velocity;
  final double? angle;

  @factory
  WeatherWindy copy({
    double? velocity,
    double? angle,
  }) =>
      WeatherWindy(
        velocity: velocity ?? this.velocity,
        angle: angle ?? this.angle,
      );

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  List<Object?> get props => [
        velocity,
        angle,
      ];
}
