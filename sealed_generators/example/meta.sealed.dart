// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Weather] {
///
/// ([PrefixSunny] sunny){} with data equality
///
/// ([BadWeather] rainy){[int] rain} with data equality
///
/// ([VeryBadWeather] windy){[double] velocity, [double]? angle} with distinct equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  const Weather._internal();

  const factory Weather.sunny() = PrefixSunny;

  const factory Weather.rainy({
    required int rain,
  }) = BadWeather;

  const factory Weather.windy({
    required double velocity,
    double? angle,
  }) = VeryBadWeather;

  bool get isSunny => this is PrefixSunny;

  bool get isRainy => this is BadWeather;

  bool get isWindy => this is VeryBadWeather;

  PrefixSunny get asSunny => this as PrefixSunny;

  BadWeather get asRainy => this as BadWeather;

  VeryBadWeather get asWindy => this as VeryBadWeather;

  PrefixSunny? get asSunnyOrNull {
    final weather = this;
    return weather is PrefixSunny ? weather : null;
  }

  BadWeather? get asRainyOrNull {
    final weather = this;
    return weather is BadWeather ? weather : null;
  }

  VeryBadWeather? get asWindyOrNull {
    final weather = this;
    return weather is VeryBadWeather ? weather : null;
  }

  R when<R extends Object?>({
    required R Function() sunny,
    required R Function(int rain) rainy,
    required R Function(double velocity, double? angle) windy,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny();
    } else if (weather is BadWeather) {
      return rainy(weather.rain);
    } else if (weather is VeryBadWeather) {
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
    if (weather is PrefixSunny) {
      return sunny != null ? sunny() : orElse(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather.rain) : orElse(weather);
    } else if (weather is VeryBadWeather) {
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
    if (weather is PrefixSunny) {
      if (sunny != null) {
        sunny();
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is BadWeather) {
      if (rainy != null) {
        rainy(weather.rain);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is VeryBadWeather) {
      if (windy != null) {
        windy(weather.velocity, weather.angle);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(PrefixSunny sunny) sunny,
    required R Function(BadWeather rainy) rainy,
    required R Function(VeryBadWeather windy) windy,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny(weather);
    } else if (weather is BadWeather) {
      return rainy(weather);
    } else if (weather is VeryBadWeather) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(PrefixSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny != null ? sunny(weather) : orElse(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather) : orElse(weather);
    } else if (weather is VeryBadWeather) {
      return windy != null ? windy(weather) : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  void partialMap({
    void Function(PrefixSunny sunny)? sunny,
    void Function(BadWeather rainy)? rainy,
    void Function(VeryBadWeather windy)? windy,
    void Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      if (sunny != null) {
        sunny(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is BadWeather) {
      if (rainy != null) {
        rainy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is VeryBadWeather) {
      if (windy != null) {
        windy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }
}

/// (([PrefixSunny] : [Weather]) sunny){}
///
/// with data equality
class PrefixSunny extends Weather with EquatableMixin {
  const PrefixSunny() : super._internal();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

/// (([BadWeather] : [Weather]) rainy){[int] rain}
///
/// with data equality
class BadWeather extends Weather with EquatableMixin {
  const BadWeather({
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

/// (([VeryBadWeather] : [Weather]) windy){[double] velocity, [double]? angle}
///
/// with distinct equality
class VeryBadWeather extends Weather {
  const VeryBadWeather({
    required this.velocity,
    this.angle,
  }) : super._internal();

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  bool operator ==(Object other) => false;
}
