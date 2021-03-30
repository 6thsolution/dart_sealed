// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_nullsafe_data.dart';

// **************************************************************************
// Generator: sealed_generators
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

@SealedManifest(manifest: _Weather)
abstract class Weather extends Equatable {
// ...
}

class WeatherSunny extends Weather {
  // ...

  @override
  List<Object?> get props => [];
}

class WeatherRainy extends Weather {
  // ...

  @override
  List<Object?> get props => [];
}

class WeatherWindy extends Weather {
  // ...

  @override
  List<Object?> get props => [];
}
