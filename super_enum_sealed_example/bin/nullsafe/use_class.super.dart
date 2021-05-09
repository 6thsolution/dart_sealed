// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_class.dart';

// **************************************************************************
// Generator: super_enum_sealed_generators
// **************************************************************************

// ignore_for_file: unused_element, unused_field

/// substitute generated manifest for super enum
/// and remove "$" at the end of class name.
@Sealed()
abstract class _Weather$ {
  @Meta(name: 'Sunny', equality: Equality.data)
  void sunny();

  @Meta(name: 'Rainy', equality: Equality.data)
  void rainy(Hello data);
}

/// [Weather] {
///
/// ([Sunny] sunny){} with data equality
///
/// ([Rainy] rainy){[Hello] data} with data equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  @factory
  static Sunny sunny() => Sunny();

  @factory
  static Rainy rainy({
    required Hello data,
  }) =>
      Rainy(
        data: data,
      );

  bool isSunny() => this is Sunny;

  bool isRainy() => this is Rainy;

  Sunny asSunny() => this as Sunny;

  Rainy asRainy() => this as Rainy;

  Sunny? asSunnyOrNull() {
    final weather = this;
    return weather is Sunny ? weather : null;
  }

  Rainy? asRainyOrNull() {
    final weather = this;
    return weather is Rainy ? weather : null;
  }

  R when<R extends Object?>({
    required R Function(Sunny sunny) sunny,
    required R Function(Rainy rainy) rainy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      return sunny(weather);
    } else if (weather is Rainy) {
      return rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(Sunny sunny)? sunny,
    R Function(Rainy rainy)? rainy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is Sunny) {
      return sunny != null ? sunny(weather) : orElse(weather);
    } else if (weather is Rainy) {
      return rainy != null ? rainy(weather) : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(Sunny sunny)? sunny,
    R Function(Rainy rainy)? rainy,
    required R orDefault,
  }) {
    final weather = this;
    if (weather is Sunny) {
      return sunny != null ? sunny(weather) : orDefault;
    } else if (weather is Rainy) {
      return rainy != null ? rainy(weather) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Sunny sunny)? sunny,
    R Function(Rainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      return sunny?.call(weather);
    } else if (weather is Rainy) {
      return rainy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(Sunny sunny)? sunny,
    R Function(Rainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is Sunny && sunny != null) {
      return sunny(weather);
    } else if (weather is Rainy && rainy != null) {
      return rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(Sunny sunny) sunny,
    required void Function(Rainy rainy) rainy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      sunny(weather);
    } else if (weather is Rainy) {
      rainy(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(Sunny sunny)? sunny,
    void Function(Rainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is Sunny) {
      sunny?.call(weather);
    } else if (weather is Rainy) {
      rainy?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(Sunny sunny)? sunny,
    void Function(Rainy rainy)? rainy,
    required void Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is Sunny) {
      if (sunny != null) {
        sunny(weather);
      } else {
        orElse(weather);
      }
    } else if (weather is Rainy) {
      if (rainy != null) {
        rainy(weather);
      } else {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(Sunny sunny)? sunny,
    void Function(Rainy rainy)? rainy,
  }) {
    final weather = this;
    if (weather is Sunny && sunny != null) {
      sunny(weather);
    } else if (weather is Rainy && rainy != null) {
      rainy(weather);
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
  Sunny copy() => Sunny();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

/// (([Rainy] : [Weather]) rainy){[Hello] data}
///
/// with data equality
class Rainy extends Weather with EquatableMixin {
  Rainy({
    required this.data,
  });

  final Hello data;

  @factory
  Rainy copy({
    Hello? data,
  }) =>
      Rainy(
        data: data ?? this.data,
      );

  @override
  String toString() => 'Weather.rainy(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}
