// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'weather_legacy_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: legacy
// no params identified.
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.data)
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
abstract class Weather extends Equatable {
  @factory
  static WeatherSunny /*!*/ sunny() => WeatherSunny();

  @factory
  static WeatherRainy /*!*/ rainy({@required int /*?*/ rain}) =>
      WeatherRainy(rain: rain);

  @factory
  static WeatherWindy /*!*/ windy({
    @required double /*?*/ velocity,
    @required double /*?*/ angle,
  }) =>
      WeatherWindy(
        velocity: velocity,
        angle: angle,
      );

  bool isSunny() => this is WeatherSunny /*!*/;

  bool isRainy() => this is WeatherRainy /*!*/;

  bool isWindy() => this is WeatherWindy /*!*/;

  WeatherSunny /*!*/ asSunny() => this as WeatherSunny /*!*/;

  WeatherRainy /*!*/ asRainy() => this as WeatherRainy /*!*/;

  WeatherWindy /*!*/ asWindy() => this as WeatherWindy /*!*/;

  WeatherSunny /*?*/ asSunnyOrNull() {
    final weather = this;
    return weather is WeatherSunny /*!*/ ? weather : null;
  }

  WeatherRainy /*?*/ asRainyOrNull() {
    final weather = this;
    return weather is WeatherRainy /*!*/ ? weather : null;
  }

  WeatherWindy /*?*/ asWindyOrNull() {
    final weather = this;
    return weather is WeatherWindy /*!*/ ? weather : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(WeatherSunny /*!*/ sunny) /*!*/ sunny,
    @required R Function(WeatherRainy /*!*/ rainy) /*!*/ rainy,
    @required R Function(WeatherWindy /*!*/ windy) /*!*/ windy,
  }) {
    assert(sunny != null);
    assert(rainy != null);
    assert(windy != null);
    final weather = this;
    throw 0;
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(WeatherSunny /*!*/ sunny) /*?*/ sunny,
    R Function(WeatherRainy /*!*/ rainy) /*?*/ rainy,
    R Function(WeatherWindy /*!*/ windy) /*?*/ windy,
    @required R Function(Weather /*!*/ weather) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final weather = this;
    throw 0;
  }
}

class WeatherSunny extends Weather {
  WeatherSunny();

  @factory
  WeatherSunny /*!*/ copy() => WeatherSunny();

  @override
  String /*!*/ toString() => 'Weather.sunny()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

class WeatherRainy extends Weather {
  WeatherRainy({@required this.rain});

  final int /*?*/ rain;

  @factory
  WeatherRainy /*!*/ copy({int /*?*/ rain}) =>
      WeatherRainy(rain: rain ?? this.rain);

  @override
  String /*!*/ toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object /*?*/ > /*!*/ get props => [rain];
}

class WeatherWindy extends Weather {
  WeatherWindy({
    @required this.velocity,
    @required this.angle,
  });

  final double /*?*/ velocity;
  final double /*?*/ angle;

  @factory
  WeatherWindy /*!*/ copy({
    double /*?*/ velocity,
    double /*?*/ angle,
  }) =>
      WeatherWindy(
        velocity: velocity ?? this.velocity,
        angle: angle ?? this.angle,
      );

  @override
  String /*!*/ toString() =>
      'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        velocity,
        angle,
      ];
}
