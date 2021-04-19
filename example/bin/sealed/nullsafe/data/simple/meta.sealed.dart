// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Weather {
///
/// (WeatherSunny sunny){} with data equality
///
/// (BadWeather rainy){int rain} with data equality
///
/// (VeryBadWeather windy){double velocity, double? angle} with distinct equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  @factory
  static WeatherSunny sunny() => WeatherSunny();

  @factory
  static BadWeather rainy({
    required int rain,
  }) =>
      BadWeather(
        rain: rain,
      );

  @factory
  static VeryBadWeather windy({
    required double velocity,
    required double? angle,
  }) =>
      VeryBadWeather(
        velocity: velocity,
        angle: angle,
      );

  bool isSunny() => this is WeatherSunny;

  bool isRainy() => this is BadWeather;

  bool isWindy() => this is VeryBadWeather;

  WeatherSunny asSunny() => this as WeatherSunny;

  BadWeather asRainy() => this as BadWeather;

  VeryBadWeather asWindy() => this as VeryBadWeather;

  WeatherSunny? asSunnyOrNull() {
    final weather = this;
    return weather is WeatherSunny ? weather : null;
  }

  BadWeather? asRainyOrNull() {
    final weather = this;
    return weather is BadWeather ? weather : null;
  }

  VeryBadWeather? asWindyOrNull() {
    final weather = this;
    return weather is VeryBadWeather ? weather : null;
  }

  R when<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(BadWeather rainy) rainy,
    required R Function(VeryBadWeather windy) windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny(weather);
    } else if (weather is BadWeather) {
      return rainy(weather);
    } else if (weather is VeryBadWeather) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return (sunny ?? orElse)(weather);
    } else if (weather is BadWeather) {
      return (rainy ?? orElse)(weather);
    } else if (weather is VeryBadWeather) {
      return (windy ?? orElse)(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
    required R orDefault,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather) : orDefault;
    } else if (weather is VeryBadWeather) {
      return windy != null ? windy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny?.call(weather);
    } else if (weather is BadWeather) {
      return rainy?.call(weather);
    } else if (weather is VeryBadWeather) {
      return windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny && sunny != null) {
      return sunny(weather);
    } else if (weather is BadWeather && rainy != null) {
      return rainy(weather);
    } else if (weather is VeryBadWeather && windy != null) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(WeatherSunny sunny) sunny,
    required void Function(BadWeather rainy) rainy,
    required void Function(VeryBadWeather windy) windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      sunny(weather);
    } else if (weather is BadWeather) {
      rainy(weather);
    } else if (weather is VeryBadWeather) {
      windy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(WeatherSunny sunny)? sunny,
    void Function(BadWeather rainy)? rainy,
    void Function(VeryBadWeather windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      sunny?.call(weather);
    } else if (weather is BadWeather) {
      rainy?.call(weather);
    } else if (weather is VeryBadWeather) {
      windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(WeatherSunny sunny)? sunny,
    void Function(BadWeather rainy)? rainy,
    void Function(VeryBadWeather windy)? windy,
    required void Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      (sunny ?? orElse)(weather);
    } else if (weather is BadWeather) {
      (rainy ?? orElse)(weather);
    } else if (weather is VeryBadWeather) {
      (windy ?? orElse)(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(WeatherSunny sunny)? sunny,
    void Function(BadWeather rainy)? rainy,
    void Function(VeryBadWeather windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny && sunny != null) {
      sunny(weather);
    } else if (weather is BadWeather && rainy != null) {
      rainy(weather);
    } else if (weather is VeryBadWeather && windy != null) {
      windy(weather);
    } else {
      throw AssertionError();
    }
  }
}

class WeatherSunny extends Weather with EquatableMixin {
  WeatherSunny();

  @factory
  WeatherSunny copy() => WeatherSunny();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

class BadWeather extends Weather with EquatableMixin {
  BadWeather({
    required this.rain,
  });

  final int rain;

  @factory
  BadWeather copy({
    int? rain,
  }) =>
      BadWeather(
        rain: rain ?? this.rain,
      );

  @override
  String toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object?> get props => [
        rain,
      ];
}

class VeryBadWeather extends Weather {
  VeryBadWeather({
    required this.velocity,
    required this.angle,
  });

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  bool operator ==(Object other) => false;
}
