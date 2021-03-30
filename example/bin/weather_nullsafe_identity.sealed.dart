// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_nullsafe_identity.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: null-safe
@Sealed(equality: SealedEquality.identity)
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
