// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Weather] {
///
/// ([WeatherSunny] sunny){} with identity equality
///
/// ([WeatherRainy] rainy){[int] rain} with identity equality
///
/// ([WeatherWindy] windy){[double] velocity, [double]? angle} with identity equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  const Weather._internal();

  const factory Weather.sunny() = WeatherSunny;

  const factory Weather.rainy({
    required int rain,
  }) = WeatherRainy;

  const factory Weather.windy({
    required double velocity,
    double? angle,
  }) = WeatherWindy;

  bool get isSunny => this is WeatherSunny;

  bool get isRainy => this is WeatherRainy;

  bool get isWindy => this is WeatherWindy;

  WeatherSunny get asSunny => this as WeatherSunny;

  WeatherRainy get asRainy => this as WeatherRainy;

  WeatherWindy get asWindy => this as WeatherWindy;

  WeatherSunny? get asSunnyOrNull {
    final weather = this;
    return weather is WeatherSunny ? weather : null;
  }

  WeatherRainy? get asRainyOrNull {
    final weather = this;
    return weather is WeatherRainy ? weather : null;
  }

  WeatherWindy? get asWindyOrNull {
    final weather = this;
    return weather is WeatherWindy ? weather : null;
  }

  R when<R extends Object?>({
    required R Function() sunny,
    required R Function(int rain) rainy,
    required R Function(double velocity, double? angle) windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny();
    } else if (weather is WeatherRainy) {
      return rainy(weather.rain);
    } else if (weather is WeatherWindy) {
      return windy(weather.velocity, weather.angle);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? sunny,
    R Function(int rain)? rainy,
    R Function(double velocity, double? angle)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny() : orElse(weather);
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather.rain) : orElse(weather);
    } else if (weather is WeatherWindy) {
      return windy != null
          ? windy(weather.velocity, weather.angle)
          : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  void partialWhen({
    void Function()? sunny,
    void Function(int rain)? rainy,
    void Function(double velocity, double? angle)? windy,
    void Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      if (sunny != null) {
        sunny();
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is WeatherRainy) {
      if (rainy != null) {
        rainy(weather.rain);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is WeatherWindy) {
      if (windy != null) {
        windy(weather.velocity, weather.angle);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? sunny,
    R Function(int rain)? rainy,
    R Function(double velocity, double? angle)? windy,
    R Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny() : orElse?.call(weather);
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather.rain) : orElse?.call(weather);
    } else if (weather is WeatherWindy) {
      return windy != null
          ? windy(weather.velocity, weather.angle)
          : orElse?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(WeatherRainy rainy) rainy,
    required R Function(WeatherWindy windy) windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny(weather);
    } else if (weather is WeatherRainy) {
      return rainy(weather);
    } else if (weather is WeatherWindy) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny(weather) : orElse(weather);
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather) : orElse(weather);
    } else if (weather is WeatherWindy) {
      return windy != null ? windy(weather) : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  void partialMap({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
    void Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      if (sunny != null) {
        sunny(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is WeatherRainy) {
      if (rainy != null) {
        rainy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is WeatherWindy) {
      if (windy != null) {
        windy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    R Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny(weather) : orElse?.call(weather);
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather) : orElse?.call(weather);
    } else if (weather is WeatherWindy) {
      return windy != null ? windy(weather) : orElse?.call(weather);
    } else {
      throw AssertionError();
    }
  }
}

/// (([WeatherSunny] : [Weather]) sunny){}
///
/// with identity equality
class WeatherSunny extends Weather {
  const WeatherSunny() : super._internal();

  @override
  String toString() => 'Weather.sunny()';
}

/// (([WeatherRainy] : [Weather]) rainy){[int] rain}
///
/// with identity equality
class WeatherRainy extends Weather {
  const WeatherRainy({
    required this.rain,
  }) : super._internal();

  final int rain;

  @override
  String toString() => 'Weather.rainy(rain: $rain)';
}

/// (([WeatherWindy] : [Weather]) windy){[double] velocity, [double]? angle}
///
/// with identity equality
class WeatherWindy extends Weather {
  const WeatherWindy({
    required this.velocity,
    this.angle,
  }) : super._internal();

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';
}
