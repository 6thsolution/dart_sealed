// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'weather_legacy_identity.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.identity)
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

@SealedManifest(manifest: _Weather)
abstract class Weather {
// ...
}

class WeatherSunny extends Weather {
  // ...
}

class WeatherRainy extends Weather {
  // ...
}

class WeatherWindy extends Weather {
  // ...
}
