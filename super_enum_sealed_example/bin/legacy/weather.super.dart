// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'weather.dart';

// **************************************************************************
// Generator: super_enum_sealed_generators
// **************************************************************************

// ignore_for_file: unused_element, unused_field

/// substitute generated manifest for super enum
/// and remove "$" at the end of class name.
@Sealed()
abstract class _Weather$ {
  @WithEquality(Equality.data)
  @WithName('Sunny')
  void sunny();

  @WithEquality(Equality.data)
  @WithName('Rainy')
  void rainy(int /*!*/ rain);

  @WithEquality(Equality.data)
  @WithName('Windy')
  void windy(double /*!*/ velocity, double /*?*/ angle);
}

/// [Weather] {
///
/// ([Sunny] sunny){} with data equality
///
/// ([Rainy] rainy){[int] rain} with data equality
///
/// ([Windy] windy){[double] velocity, [double]? angle} with data equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  @factory
  static Sunny /*!*/ sunny() => Sunny();

  @factory
  static Rainy /*!*/ rainy({
    @required int /*!*/ rain,
  }) =>
      Rainy(
        rain: rain,
      );

  @factory
  static Windy /*!*/ windy({
    @required double /*!*/ velocity,
    @required double /*?*/ angle,
  }) =>
      Windy(
        velocity: velocity,
        angle: angle,
      );

  bool /*!*/ isSunny() => this is Sunny;

  bool /*!*/ isRainy() => this is Rainy;

  bool /*!*/ isWindy() => this is Windy;

  Sunny /*!*/ asSunny() => this as Sunny;

  Rainy /*!*/ asRainy() => this as Rainy;

  Windy /*!*/ asWindy() => this as Windy;

  Sunny /*?*/ asSunnyOrNull() {
    final weather = this;
    return weather is Sunny ? weather : null;
  }

  Rainy /*?*/ asRainyOrNull() {
    final weather = this;
    return weather is Rainy ? weather : null;
  }

  Windy /*?*/ asWindyOrNull() {
    final weather = this;
    return weather is Windy ? weather : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(Sunny /*!*/ sunny) /*!*/ sunny,
    @required R Function(Rainy /*!*/ rainy) /*!*/ rainy,
    @required R Function(Windy /*!*/ windy) /*!*/ windy,
  }) {
    assert(sunny != null);
    assert(rainy != null);
    assert(windy != null);
    final weather = this;
    if (weather is Sunny) {
      return sunny(weather);
    } else if (weather is Rainy) {
      return rainy(weather);
    } else if (weather is Windy) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(Sunny /*!*/ sunny) /*?*/ sunny,
    R Function(Rainy /*!*/ rainy) /*?*/ rainy,
    R Function(Windy /*!*/ windy) /*?*/ windy,
    @required R Function(Weather /*!*/ weather) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final weather = this;
    if (weather is Sunny) {
      return sunny != null ? sunny(weather) : orElse(weather);
    } else if (weather is Rainy) {
      return rainy != null ? rainy(weather) : orElse(weather);
    } else if (weather is Windy) {
      return windy != null ? windy(weather) : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(Sunny /*!*/ sunny) /*?*/ sunny,
    R Function(Rainy /*!*/ rainy) /*?*/ rainy,
    R Function(Windy /*!*/ windy) /*?*/ windy,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final weather = this;
    if (weather is Sunny) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is Rainy) {
      return rainy != null ? rainy(weather) : orDefault;
    } else if (weather is Windy) {
      return windy != null ? windy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(Sunny /*!*/ sunny) /*?*/ sunny,
    R Function(Rainy /*!*/ rainy) /*?*/ rainy,
    R Function(Windy /*!*/ windy) /*?*/ windy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      return sunny?.call(weather);
    } else if (weather is Rainy) {
      return rainy?.call(weather);
    } else if (weather is Windy) {
      return windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(Sunny /*!*/ sunny) /*?*/ sunny,
    R Function(Rainy /*!*/ rainy) /*?*/ rainy,
    R Function(Windy /*!*/ windy) /*?*/ windy,
  }) {
    final weather = this;
    if (weather is Sunny && sunny != null) {
      return sunny(weather);
    } else if (weather is Rainy && rainy != null) {
      return rainy(weather);
    } else if (weather is Windy && windy != null) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  void whenPartial({
    void Function(Sunny /*!*/ sunny) /*?*/ sunny,
    void Function(Rainy /*!*/ rainy) /*?*/ rainy,
    void Function(Windy /*!*/ windy) /*?*/ windy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      sunny?.call(weather);
    } else if (weather is Rainy) {
      rainy?.call(weather);
    } else if (weather is Windy) {
      windy?.call(weather);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Sunny] : [Weather]) sunny){}
///
/// with data equality
class Sunny extends Weather with EquatableMixin {
  Sunny();

  @factory
  Sunny /*!*/ copy() => Sunny();

  @override
  String /*!*/ toString() => 'Weather.sunny()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

/// (([Rainy] : [Weather]) rainy){[int] rain}
///
/// with data equality
class Rainy extends Weather with EquatableMixin {
  Rainy({
    @required this.rain,
  });

  final int /*!*/ rain;

  @factory
  Rainy /*!*/ copy({
    int /*?*/ rain,
  }) =>
      Rainy(
        rain: rain ?? this.rain,
      );

  @override
  String /*!*/ toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        rain,
      ];
}

/// (([Windy] : [Weather]) windy){[double] velocity, [double]? angle}
///
/// with data equality
class Windy extends Weather with EquatableMixin {
  Windy({
    @required this.velocity,
    @required this.angle,
  });

  final double /*!*/ velocity;
  final double /*?*/ angle;

  @override
  String /*!*/ toString() =>
      'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        velocity,
        angle,
      ];
}
