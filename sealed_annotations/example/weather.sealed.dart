// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Weather] {
///
/// ([WeatherSunny] sunny){} with data equality
///
/// ([WeatherRainy] rainy){[int] rain} with data equality
///
/// ([WeatherWindy] windy){[double] velocity, [double]? angle} with data equality
///
/// }
@immutable
@SealedManifest(_Weather)
abstract class Weather {
  const Weather._internal();

  factory Weather.sunny() = WeatherSunny;

  factory Weather.rainy({
    required int rain,
  }) = WeatherRainy;

  factory Weather.windy({
    required double velocity,
    required double? angle,
  }) = WeatherWindy;

  bool isSunny() => this is WeatherSunny;

  bool isRainy() => this is WeatherRainy;

  bool isWindy() => this is WeatherWindy;

  WeatherSunny asSunny() => this as WeatherSunny;

  WeatherRainy asRainy() => this as WeatherRainy;

  WeatherWindy asWindy() => this as WeatherWindy;

  WeatherSunny? asSunnyOrNull() {
    final weather = this;
    return weather is WeatherSunny ? weather : null;
  }

  WeatherRainy? asRainyOrNull() {
    final weather = this;
    return weather is WeatherRainy ? weather : null;
  }

  WeatherWindy? asWindyOrNull() {
    final weather = this;
    return weather is WeatherWindy ? weather : null;
  }

  R when<R extends Object?>({
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

  R whenOrElse<R extends Object?>({
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

  R whenOrDefault<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
    required R orDefault,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather) : orDefault;
    } else if (weather is WeatherWindy) {
      return windy != null ? windy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny?.call(weather);
    } else if (weather is WeatherRainy) {
      return rainy?.call(weather);
    } else if (weather is WeatherWindy) {
      return windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    R Function(WeatherWindy windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny && sunny != null) {
      return sunny(weather);
    } else if (weather is WeatherRainy && rainy != null) {
      return rainy(weather);
    } else if (weather is WeatherWindy && windy != null) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  void whenPartial({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    void Function(WeatherWindy windy)? windy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      sunny?.call(weather);
    } else if (weather is WeatherRainy) {
      rainy?.call(weather);
    } else if (weather is WeatherWindy) {
      windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }
}

/// (([WeatherSunny] : [Weather]) sunny){}
///
/// with data equality
@immutable
class WeatherSunny extends Weather with EquatableMixin {
  const WeatherSunny() : super._internal();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

/// (([WeatherRainy] : [Weather]) rainy){[int] rain}
///
/// with data equality
@immutable
class WeatherRainy extends Weather with EquatableMixin {
  const WeatherRainy({
    required this.rain,
  }) : super._internal();

  final int rain;

  @override
  String toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object?> get props => [
        rain,
      ];
}

/// (([WeatherWindy] : [Weather]) windy){[double] velocity, [double]? angle}
///
/// with data equality
@immutable
class WeatherWindy extends Weather with EquatableMixin {
  const WeatherWindy({
    required this.velocity,
    required this.angle,
  }) : super._internal();

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  List<Object?> get props => [
        velocity,
        angle,
      ];
}
