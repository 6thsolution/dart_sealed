// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixed_nullsafe_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Apple {
///
/// Hold(dynamic banana)
///
/// }
///
/// with data equality.
@SealedManifest(_Apple)
abstract class Apple extends Equatable {
  @factory
  static AppleHold hold({required dynamic banana}) => AppleHold(banana: banana);

  bool isHold() => this is AppleHold;

  AppleHold asHold() => this as AppleHold;

  AppleHold? asHoldOrNull() {
    final apple = this;
    return apple is AppleHold ? apple : null;
  }

  R when<R extends Object?>({required R Function(AppleHold hold) hold}) {
    final apple = this;
    if (apple is AppleHold) {
      return hold(apple);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(AppleHold hold)? hold,
    required R Function(Apple apple) orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return (hold ?? orElse)(apple);
    } else {
      throw AssertionError();
    }
  }
}

class AppleHold extends Apple {
  AppleHold({required this.banana});

  final dynamic banana;

  @factory
  AppleHold copy({dynamic? banana}) => AppleHold(banana: banana ?? this.banana);

  @override
  String toString() => 'Apple.hold(banana: $banana)';

  @override
  List<Object?> get props => [banana];
}

/// Banana {
///
/// Hold(dynamic apple)
///
/// }
///
/// with data equality.
@SealedManifest(_Banana)
abstract class Banana extends Equatable {
  @factory
  static BananaHold hold({required dynamic apple}) => BananaHold(apple: apple);

  bool isHold() => this is BananaHold;

  BananaHold asHold() => this as BananaHold;

  BananaHold? asHoldOrNull() {
    final banana = this;
    return banana is BananaHold ? banana : null;
  }

  R when<R extends Object?>({required R Function(BananaHold hold) hold}) {
    final banana = this;
    if (banana is BananaHold) {
      return hold(banana);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(BananaHold hold)? hold,
    required R Function(Banana banana) orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return (hold ?? orElse)(banana);
    } else {
      throw AssertionError();
    }
  }
}

class BananaHold extends Banana {
  BananaHold({required this.apple});

  final dynamic apple;

  @factory
  BananaHold copy({dynamic? apple}) => BananaHold(apple: apple ?? this.apple);

  @override
  String toString() => 'Banana.hold(apple: $apple)';

  @override
  List<Object?> get props => [apple];
}

/// Coconut {
///
/// Hold(dynamic apple, dynamic banana)
///
/// }
///
/// with data equality.
@SealedManifest(_Coconut)
abstract class Coconut extends Equatable {
  @factory
  static CoconutHold hold({
    required dynamic apple,
    required dynamic banana,
  }) =>
      CoconutHold(
        apple: apple,
        banana: banana,
      );

  bool isHold() => this is CoconutHold;

  CoconutHold asHold() => this as CoconutHold;

  CoconutHold? asHoldOrNull() {
    final coconut = this;
    return coconut is CoconutHold ? coconut : null;
  }

  R when<R extends Object?>({required R Function(CoconutHold hold) hold}) {
    final coconut = this;
    if (coconut is CoconutHold) {
      return hold(coconut);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(CoconutHold hold)? hold,
    required R Function(Coconut coconut) orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutHold) {
      return (hold ?? orElse)(coconut);
    } else {
      throw AssertionError();
    }
  }
}

class CoconutHold extends Coconut {
  CoconutHold({
    required this.apple,
    required this.banana,
  });

  final dynamic apple;
  final dynamic banana;

  @factory
  CoconutHold copy({
    dynamic? apple,
    dynamic? banana,
  }) =>
      CoconutHold(
        apple: apple ?? this.apple,
        banana: banana ?? this.banana,
      );

  @override
  String toString() => 'Coconut.hold(apple: $apple, banana: $banana)';

  @override
  List<Object?> get props => [
        apple,
        banana,
      ];
}
