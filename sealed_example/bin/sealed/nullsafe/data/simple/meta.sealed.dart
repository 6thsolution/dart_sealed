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
@immutable
@SealedManifest(_Weather)
abstract class Weather {
  const Weather._internal();

  const factory Weather.sunny() = PrefixSunny;

  const factory Weather.rainy({
    required int rain,
  }) = BadWeather;

  const factory Weather.windy({
    required double velocity,
    required double? angle,
  }) = VeryBadWeather;

  bool isSunny() => this is PrefixSunny;

  bool isRainy() => this is BadWeather;

  bool isWindy() => this is VeryBadWeather;

  PrefixSunny asSunny() => this as PrefixSunny;

  BadWeather asRainy() => this as BadWeather;

  VeryBadWeather asWindy() => this as VeryBadWeather;

  PrefixSunny? asSunnyOrNull() {
    final weather = this;
    return weather is PrefixSunny ? weather : null;
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

  R maybeWhen<R extends Object?>({
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

  void partialWhen({
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
@immutable
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
@immutable
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
@immutable
class VeryBadWeather extends Weather {
  const VeryBadWeather({
    required this.velocity,
    required this.angle,
  }) : super._internal();

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  bool operator ==(Object other) => false;
}
