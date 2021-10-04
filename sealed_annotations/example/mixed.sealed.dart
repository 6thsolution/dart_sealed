// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixed.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Apple] {
///
/// ([AppleHold] hold){[Banana]? banana} with data equality
///
/// }
@SealedManifest(_Apple)
abstract class Apple {
  const Apple._internal();

  const factory Apple.hold({
    Banana? banana,
  }) = AppleHold;

  bool get isHold => this is AppleHold;

  AppleHold get asHold => this as AppleHold;

  AppleHold? get asHoldOrNull {
    final apple = this;
    return apple is AppleHold ? apple : null;
  }

  R when<R extends Object?>({
    required R Function(Banana? banana) hold,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold(apple.banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Banana? banana)? hold,
    required R Function(Apple apple) orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold != null ? hold(apple.banana) : orElse(apple);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Banana? banana)? hold,
    void Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      if (hold != null) {
        hold(apple.banana);
      } else if (orElse != null) {
        orElse(apple);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Banana? banana)? hold,
    R Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold != null ? hold(apple.banana) : orElse?.call(apple);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(AppleHold hold) hold,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold(apple);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(AppleHold hold)? hold,
    required R Function(Apple apple) orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold != null ? hold(apple) : orElse(apple);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(AppleHold hold)? hold,
    void Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      if (hold != null) {
        hold(apple);
      } else if (orElse != null) {
        orElse(apple);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(AppleHold hold)? hold,
    R Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleHold) {
      return hold != null ? hold(apple) : orElse?.call(apple);
    } else {
      throw AssertionError();
    }
  }
}

/// (([AppleHold] : [Apple]) hold){[Banana]? banana}
///
/// with data equality
class AppleHold extends Apple with EquatableMixin {
  const AppleHold({
    this.banana,
  }) : super._internal();

  final Banana? banana;

  @override
  String toString() => 'Apple.hold(banana: $banana)';

  @override
  List<Object?> get props => [
        banana,
      ];
}

/// [Banana] {
///
/// ([BananaHold] hold){[Apple] apple} with data equality
///
/// }
@SealedManifest(_Banana)
abstract class Banana {
  const Banana._internal();

  const factory Banana.hold({
    required Apple apple,
  }) = BananaHold;

  bool get isHold => this is BananaHold;

  BananaHold get asHold => this as BananaHold;

  BananaHold? get asHoldOrNull {
    final banana = this;
    return banana is BananaHold ? banana : null;
  }

  R when<R extends Object?>({
    required R Function(Apple apple) hold,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold(banana.apple);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Apple apple)? hold,
    required R Function(Banana banana) orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold != null ? hold(banana.apple) : orElse(banana);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Apple apple)? hold,
    void Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      if (hold != null) {
        hold(banana.apple);
      } else if (orElse != null) {
        orElse(banana);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Apple apple)? hold,
    R Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold != null ? hold(banana.apple) : orElse?.call(banana);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(BananaHold hold) hold,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold(banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(BananaHold hold)? hold,
    required R Function(Banana banana) orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold != null ? hold(banana) : orElse(banana);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(BananaHold hold)? hold,
    void Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      if (hold != null) {
        hold(banana);
      } else if (orElse != null) {
        orElse(banana);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(BananaHold hold)? hold,
    R Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaHold) {
      return hold != null ? hold(banana) : orElse?.call(banana);
    } else {
      throw AssertionError();
    }
  }
}

/// (([BananaHold] : [Banana]) hold){[Apple] apple}
///
/// with data equality
class BananaHold extends Banana with EquatableMixin {
  const BananaHold({
    required this.apple,
  }) : super._internal();

  final Apple apple;

  @override
  String toString() => 'Banana.hold(apple: $apple)';

  @override
  List<Object?> get props => [
        apple,
      ];
}

/// [Coconut] {
///
/// ([CoconutTest1] test1){[int] x, [double] y} with data equality
///
/// ([CoconutTest2] test2){[int]? x, [double]? y} with data equality
///
/// ([CoconutHold] hold){[Apple]? apple, [Banana]? banana} with data equality
///
/// }
@SealedManifest(_Coconut)
abstract class Coconut {
  const Coconut._internal();

  const factory Coconut.test1({
    required int x,
    required double y,
  }) = CoconutTest1;

  const factory Coconut.test2({
    int? x,
    double? y,
  }) = CoconutTest2;

  const factory Coconut.hold({
    Apple? apple,
    Banana? banana,
  }) = CoconutHold;

  bool get isTest1 => this is CoconutTest1;

  bool get isTest2 => this is CoconutTest2;

  bool get isHold => this is CoconutHold;

  CoconutTest1 get asTest1 => this as CoconutTest1;

  CoconutTest2 get asTest2 => this as CoconutTest2;

  CoconutHold get asHold => this as CoconutHold;

  CoconutTest1? get asTest1OrNull {
    final coconut = this;
    return coconut is CoconutTest1 ? coconut : null;
  }

  CoconutTest2? get asTest2OrNull {
    final coconut = this;
    return coconut is CoconutTest2 ? coconut : null;
  }

  CoconutHold? get asHoldOrNull {
    final coconut = this;
    return coconut is CoconutHold ? coconut : null;
  }

  R when<R extends Object?>({
    required R Function(int x, double y) test1,
    required R Function(int? x, double? y) test2,
    required R Function(Apple? apple, Banana? banana) hold,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1(coconut.x, coconut.y);
    } else if (coconut is CoconutTest2) {
      return test2(coconut.x, coconut.y);
    } else if (coconut is CoconutHold) {
      return hold(coconut.apple, coconut.banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(int x, double y)? test1,
    R Function(int? x, double? y)? test2,
    R Function(Apple? apple, Banana? banana)? hold,
    required R Function(Coconut coconut) orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1 != null ? test1(coconut.x, coconut.y) : orElse(coconut);
    } else if (coconut is CoconutTest2) {
      return test2 != null ? test2(coconut.x, coconut.y) : orElse(coconut);
    } else if (coconut is CoconutHold) {
      return hold != null
          ? hold(coconut.apple, coconut.banana)
          : orElse(coconut);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(int x, double y)? test1,
    void Function(int? x, double? y)? test2,
    void Function(Apple? apple, Banana? banana)? hold,
    void Function(Coconut coconut)? orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      if (test1 != null) {
        test1(coconut.x, coconut.y);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else if (coconut is CoconutTest2) {
      if (test2 != null) {
        test2(coconut.x, coconut.y);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else if (coconut is CoconutHold) {
      if (hold != null) {
        hold(coconut.apple, coconut.banana);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(int x, double y)? test1,
    R Function(int? x, double? y)? test2,
    R Function(Apple? apple, Banana? banana)? hold,
    R Function(Coconut coconut)? orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1 != null
          ? test1(coconut.x, coconut.y)
          : orElse?.call(coconut);
    } else if (coconut is CoconutTest2) {
      return test2 != null
          ? test2(coconut.x, coconut.y)
          : orElse?.call(coconut);
    } else if (coconut is CoconutHold) {
      return hold != null
          ? hold(coconut.apple, coconut.banana)
          : orElse?.call(coconut);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(CoconutTest1 test1) test1,
    required R Function(CoconutTest2 test2) test2,
    required R Function(CoconutHold hold) hold,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1(coconut);
    } else if (coconut is CoconutTest2) {
      return test2(coconut);
    } else if (coconut is CoconutHold) {
      return hold(coconut);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(CoconutTest1 test1)? test1,
    R Function(CoconutTest2 test2)? test2,
    R Function(CoconutHold hold)? hold,
    required R Function(Coconut coconut) orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1 != null ? test1(coconut) : orElse(coconut);
    } else if (coconut is CoconutTest2) {
      return test2 != null ? test2(coconut) : orElse(coconut);
    } else if (coconut is CoconutHold) {
      return hold != null ? hold(coconut) : orElse(coconut);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(CoconutTest1 test1)? test1,
    void Function(CoconutTest2 test2)? test2,
    void Function(CoconutHold hold)? hold,
    void Function(Coconut coconut)? orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      if (test1 != null) {
        test1(coconut);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else if (coconut is CoconutTest2) {
      if (test2 != null) {
        test2(coconut);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else if (coconut is CoconutHold) {
      if (hold != null) {
        hold(coconut);
      } else if (orElse != null) {
        orElse(coconut);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(CoconutTest1 test1)? test1,
    R Function(CoconutTest2 test2)? test2,
    R Function(CoconutHold hold)? hold,
    R Function(Coconut coconut)? orElse,
  }) {
    final coconut = this;
    if (coconut is CoconutTest1) {
      return test1 != null ? test1(coconut) : orElse?.call(coconut);
    } else if (coconut is CoconutTest2) {
      return test2 != null ? test2(coconut) : orElse?.call(coconut);
    } else if (coconut is CoconutHold) {
      return hold != null ? hold(coconut) : orElse?.call(coconut);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CoconutTest1] : [Coconut]) test1){[int] x, [double] y}
///
/// with data equality
class CoconutTest1 extends Coconut with EquatableMixin {
  const CoconutTest1({
    required this.x,
    required this.y,
  }) : super._internal();

  final int x;
  final double y;

  @override
  String toString() => 'Coconut.test1(x: $x, y: $y)';

  @override
  List<Object?> get props => [
        x,
        y,
      ];
}

/// (([CoconutTest2] : [Coconut]) test2){[int]? x, [double]? y}
///
/// with data equality
class CoconutTest2 extends Coconut with EquatableMixin {
  const CoconutTest2({
    this.x,
    this.y,
  }) : super._internal();

  final int? x;
  final double? y;

  @override
  String toString() => 'Coconut.test2(x: $x, y: $y)';

  @override
  List<Object?> get props => [
        x,
        y,
      ];
}

/// (([CoconutHold] : [Coconut]) hold){[Apple]? apple, [Banana]? banana}
///
/// with data equality
class CoconutHold extends Coconut with EquatableMixin {
  const CoconutHold({
    this.apple,
    this.banana,
  }) : super._internal();

  final Apple? apple;
  final Banana? banana;

  @override
  String toString() => 'Coconut.hold(apple: $apple, banana: $banana)';

  @override
  List<Object?> get props => [
        apple,
        banana,
      ];
}
