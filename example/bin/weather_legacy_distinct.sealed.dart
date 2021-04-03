// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'weather_legacy_distinct.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.distinct)
// ignore: unused_element
abstract class _Weather$ {
  void sunny();

  void rainy(int /*?*/ rain);

  void windy(
    double /*?*/ velocity,
    double /*?*/ angle,
  );
}
// **************************************************************************

@SealedManifest(_Weather)
abstract class Weather {
  static WeatherSunny sunny() => WeatherSunny();

  static WeatherRainy rainy() => WeatherRainy();

  static WeatherWindy windy() => WeatherWindy();

  bool isSunny() => this is WeatherSunny;

  WeatherSunny asSunny() => this as WeatherSunny;

  WeatherSunny /*?*/ asSunnyOrNull() => isSunny() ? asSunny() : null;

  bool isRainy() => this is WeatherRainy;

  WeatherRainy asRainy() => this as WeatherRainy;

  WeatherRainy /*?*/ asRainyOrNull() => isRainy() ? asRainy() : null;

  bool isWindy() => this is WeatherWindy;

  WeatherWindy asWindy() => this as WeatherWindy;

  WeatherWindy /*?*/ asWindyOrNull() => isWindy() ? asWindy() : null;
}

class WeatherSunny extends Weather {}

class WeatherRainy extends Weather {}

class WeatherWindy extends Weather {}
