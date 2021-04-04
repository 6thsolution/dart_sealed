// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_nullsafe_distinct.dart';

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
@Sealed(equality: SealedEquality.distinct)
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
abstract class Weather {
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

  @override
  bool operator ==(Object other) => false;
}

class WeatherSunny extends Weather {
  WeatherSunny();

  @override
  String toString() => 'Weather.sunny()';
}

class WeatherRainy extends Weather {
  WeatherRainy({required this.rain});

  final int rain;

  @override
  String toString() => 'Weather.rainy(rain: $rain)';
}

class WeatherWindy extends Weather {
  WeatherWindy({
    required this.velocity,
    required this.angle,
  });

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';
}
