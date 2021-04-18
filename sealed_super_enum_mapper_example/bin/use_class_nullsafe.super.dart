// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_class_nullsafe.dart';

// **************************************************************************
// Generator: sealed_super_enum_mapper
// **************************************************************************

// ignore_for_file: unused_element, unused_field

/// substitute generated manifest for super enum
/// and remove "$" at the end of class name.
@Sealed()
abstract class _Weather$ {
  @Meta(name: 'Sunny', equality: Equality.data)
  void sunny();

  @Meta(name: 'Rainy', equality: Equality.data)
  void rainy();
}

/// Weather {
///
/// (Sunny sunny){} with data equality
///
/// (Rainy rainy){} with data equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  @factory
  static WeatherSunny sunny() => WeatherSunny();

  @factory
  static WeatherRainy rainy() => WeatherRainy();

  bool isSunny() => this is WeatherSunny;

  bool isRainy() => this is WeatherRainy;

  WeatherSunny asSunny() => this as WeatherSunny;

  WeatherRainy asRainy() => this as WeatherRainy;

  WeatherSunny? asSunnyOrNull() {
    final weather = this;
    return weather is WeatherSunny ? weather : null;
  }

  WeatherRainy? asRainyOrNull() {
    final weather = this;
    return weather is WeatherRainy ? weather : null;
  }

  R when<R extends Object?>({
    required R Function(WeatherSunny sunny) sunny,
    required R Function(WeatherRainy rainy) rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny(weather);
    } else if (weather is WeatherRainy) {
      return rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return (sunny ?? orElse)(weather);
    } else if (weather is WeatherRainy) {
      return (rainy ?? orElse)(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
    required R orDefault,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is WeatherRainy) {
      return rainy != null ? rainy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      return sunny?.call(weather);
    } else if (weather is WeatherRainy) {
      return rainy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(WeatherSunny sunny)? sunny,
    R Function(WeatherRainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny && sunny != null) {
      return sunny(weather);
    } else if (weather is WeatherRainy && rainy != null) {
      return rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(WeatherSunny sunny) sunny,
    required void Function(WeatherRainy rainy) rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      sunny(weather);
    } else if (weather is WeatherRainy) {
      rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      sunny?.call(weather);
    } else if (weather is WeatherRainy) {
      rainy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
    required void Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is WeatherSunny) {
      (sunny ?? orElse)(weather);
    } else if (weather is WeatherRainy) {
      (rainy ?? orElse)(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(WeatherSunny sunny)? sunny,
    void Function(WeatherRainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is WeatherSunny && sunny != null) {
      sunny(weather);
    } else if (weather is WeatherRainy && rainy != null) {
      rainy(weather);
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
  String toString() => 'Weather.Sunny()';

  @override
  List<Object?> get props => [];
}

class WeatherRainy extends Weather with EquatableMixin {
  WeatherRainy();

  @factory
  WeatherRainy copy() => WeatherRainy();

  @override
  String toString() => 'Weather.Rainy()';

  @override
  List<Object?> get props => [];
}
