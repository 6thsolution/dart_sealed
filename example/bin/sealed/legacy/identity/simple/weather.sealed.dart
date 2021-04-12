// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'weather.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Weather {
///
/// Sunny()
///
/// Rainy(int? rain)
///
/// Windy(double? velocity, double? angle)
///
/// }
///
/// with identity equality.
@SealedManifest(_Weather)
abstract class Weather {
  @factory
  static WeatherSunny /*!*/ sunny() => WeatherSunny();

  @factory
  static WeatherRainy /*!*/ rainy({
    @required int /*?*/ rain,
  }) =>
      WeatherRainy(
        rain: rain,
      );

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
    if (weather is WeatherSunny /*!*/) {
      return sunny(weather);
    } else if (weather is WeatherRainy /*!*/) {
      return rainy(weather);
    } else if (weather is WeatherWindy /*!*/) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(WeatherSunny /*!*/ sunny) /*?*/ sunny,
    R Function(WeatherRainy /*!*/ rainy) /*?*/ rainy,
    R Function(WeatherWindy /*!*/ windy) /*?*/ windy,
    @required R Function(Weather /*!*/ weather) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final weather = this;
    if (weather is WeatherSunny /*!*/) {
      return (sunny ?? orElse)(weather);
    } else if (weather is WeatherRainy /*!*/) {
      return (rainy ?? orElse)(weather);
    } else if (weather is WeatherWindy /*!*/) {
      return (windy ?? orElse)(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(WeatherSunny /*!*/ sunny) /*?*/ sunny,
    R Function(WeatherRainy /*!*/ rainy) /*?*/ rainy,
    R Function(WeatherWindy /*!*/ windy) /*?*/ windy,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final weather = this;
    if (weather is WeatherSunny /*!*/) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is WeatherRainy /*!*/) {
      return rainy != null ? rainy(weather) : orDefault;
    } else if (weather is WeatherWindy /*!*/) {
      return windy != null ? windy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(WeatherSunny /*!*/ sunny) /*?*/ sunny,
    R Function(WeatherRainy /*!*/ rainy) /*?*/ rainy,
    R Function(WeatherWindy /*!*/ windy) /*?*/ windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny /*!*/) {
      return sunny != null ? sunny(weather) : null;
    } else if (weather is WeatherRainy /*!*/) {
      return rainy != null ? rainy(weather) : null;
    } else if (weather is WeatherWindy /*!*/) {
      return windy != null ? windy(weather) : null;
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(WeatherSunny /*!*/ sunny) /*?*/ sunny,
    R Function(WeatherRainy /*!*/ rainy) /*?*/ rainy,
    R Function(WeatherWindy /*!*/ windy) /*?*/ windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny /*!*/ && sunny != null) {
      return sunny(weather);
    } else if (weather is WeatherRainy /*!*/ && rainy != null) {
      return rainy(weather);
    } else if (weather is WeatherWindy /*!*/ && windy != null) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(WeatherSunny /*!*/ sunny) /*!*/ sunny,
    @required void Function(WeatherRainy /*!*/ rainy) /*!*/ rainy,
    @required void Function(WeatherWindy /*!*/ windy) /*!*/ windy,
  }) {
    assert(sunny != null);
    assert(rainy != null);
    assert(windy != null);
    final weather = this;
    if (weather is WeatherSunny /*!*/) {
      sunny(weather);
    } else if (weather is WeatherRainy /*!*/) {
      rainy(weather);
    } else if (weather is WeatherWindy /*!*/) {
      windy(weather);
    } else {
      throw AssertionError();
    }
  }
}

class WeatherSunny extends Weather {
  WeatherSunny();

  @factory
  WeatherSunny /*!*/ copy() => WeatherSunny();

  @override
  String /*!*/ toString() => 'Weather.sunny()';
}

class WeatherRainy extends Weather {
  WeatherRainy({
    @required this.rain,
  });

  final int /*?*/ rain;

  @override
  String /*!*/ toString() => 'Weather.rainy(rain: $rain)';
}

class WeatherWindy extends Weather {
  WeatherWindy({
    @required this.velocity,
    @required this.angle,
  });

  final double /*?*/ velocity;
  final double /*?*/ angle;

  @override
  String /*!*/ toString() =>
      'Weather.windy(velocity: $velocity, angle: $angle)';
}
