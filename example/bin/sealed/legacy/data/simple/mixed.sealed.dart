// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'mixed.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Apple {
///
/// Hold(Banana? banana)
///
/// }
///
/// with data equality.
@SealedManifest(_Apple)
abstract class Apple extends Equatable {
  @factory
  static AppleHold /*!*/ hold({@required Banana /*?*/ banana}) =>
      AppleHold(banana: banana);

  bool isHold() => this is AppleHold /*!*/;

  AppleHold /*!*/ asHold() => this as AppleHold /*!*/;

  AppleHold /*?*/ asHoldOrNull() {
    final apple = this;
    return apple is AppleHold /*!*/ ? apple : null;
  }

  R when<R extends Object /*?*/ >(
      {@required R Function(AppleHold /*!*/ hold) /*!*/ hold}) {
    assert(hold != null);
    final apple = this;
    if (apple is AppleHold /*!*/) {
      return hold(apple);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(AppleHold /*!*/ hold) /*?*/ hold,
    @required R Function(Apple /*!*/ apple) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final apple = this;
    if (apple is AppleHold /*!*/) {
      return (hold ?? orElse)(apple);
    } else {
      throw AssertionError();
    }
  }
}

class AppleHold extends Apple {
  AppleHold({@required this.banana});

  final Banana /*?*/ banana;

  @override
  String /*!*/ toString() => 'Apple.hold(banana: $banana)';

  @override
  List<Object /*?*/ > /*!*/ get props => [banana];
}

/// Banana {
///
/// Hold(Apple? apple)
///
/// }
///
/// with data equality.
@SealedManifest(_Banana)
abstract class Banana extends Equatable {
  @factory
  static BananaHold /*!*/ hold({@required Apple /*?*/ apple}) =>
      BananaHold(apple: apple);

  bool isHold() => this is BananaHold /*!*/;

  BananaHold /*!*/ asHold() => this as BananaHold /*!*/;

  BananaHold /*?*/ asHoldOrNull() {
    final banana = this;
    return banana is BananaHold /*!*/ ? banana : null;
  }

  R when<R extends Object /*?*/ >(
      {@required R Function(BananaHold /*!*/ hold) /*!*/ hold}) {
    assert(hold != null);
    final banana = this;
    if (banana is BananaHold /*!*/) {
      return hold(banana);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(BananaHold /*!*/ hold) /*?*/ hold,
    @required R Function(Banana /*!*/ banana) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final banana = this;
    if (banana is BananaHold /*!*/) {
      return (hold ?? orElse)(banana);
    } else {
      throw AssertionError();
    }
  }
}

class BananaHold extends Banana {
  BananaHold({@required this.apple});

  final Apple /*?*/ apple;

  @override
  String /*!*/ toString() => 'Banana.hold(apple: $apple)';

  @override
  List<Object /*?*/ > /*!*/ get props => [apple];
}

/// Coconut {
///
/// Test1(int? x, double? y)
///
/// Test2(int? x, double? y)
///
/// Hold(Apple? apple, Banana? banana, int? count)
///
/// }
///
/// with data equality.
@SealedManifest(_Coconut)
abstract class Coconut extends Equatable {
  @factory
  static CoconutTest1 /*!*/ test1({
    @required int /*?*/ x,
    @required double /*?*/ y,
  }) =>
      CoconutTest1(
        x: x,
        y: y,
      );

  @factory
  static CoconutTest2 /*!*/ test2({
    @required int /*?*/ x,
    @required double /*?*/ y,
  }) =>
      CoconutTest2(
        x: x,
        y: y,
      );

  @factory
  static CoconutHold /*!*/ hold({
    @required Apple /*?*/ apple,
    @required Banana /*?*/ banana,
    @required int /*?*/ count,
  }) =>
      CoconutHold(
        apple: apple,
        banana: banana,
        count: count,
      );

  bool isTest1() => this is CoconutTest1 /*!*/;

  bool isTest2() => this is CoconutTest2 /*!*/;

  bool isHold() => this is CoconutHold /*!*/;

  CoconutTest1 /*!*/ asTest1() => this as CoconutTest1 /*!*/;

  CoconutTest2 /*!*/ asTest2() => this as CoconutTest2 /*!*/;

  CoconutHold /*!*/ asHold() => this as CoconutHold /*!*/;

  CoconutTest1 /*?*/ asTest1OrNull() {
    final coconut = this;
    return coconut is CoconutTest1 /*!*/ ? coconut : null;
  }

  CoconutTest2 /*?*/ asTest2OrNull() {
    final coconut = this;
    return coconut is CoconutTest2 /*!*/ ? coconut : null;
  }

  CoconutHold /*?*/ asHoldOrNull() {
    final coconut = this;
    return coconut is CoconutHold /*!*/ ? coconut : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(CoconutTest1 /*!*/ test1) /*!*/ test1,
    @required R Function(CoconutTest2 /*!*/ test2) /*!*/ test2,
    @required R Function(CoconutHold /*!*/ hold) /*!*/ hold,
  }) {
    assert(test1 != null);
    assert(test2 != null);
    assert(hold != null);
    final coconut = this;
    if (coconut is CoconutTest1 /*!*/) {
      return test1(coconut);
    } else if (coconut is CoconutTest2 /*!*/) {
      return test2(coconut);
    } else if (coconut is CoconutHold /*!*/) {
      return hold(coconut);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(CoconutTest1 /*!*/ test1) /*?*/ test1,
    R Function(CoconutTest2 /*!*/ test2) /*?*/ test2,
    R Function(CoconutHold /*!*/ hold) /*?*/ hold,
    @required R Function(Coconut /*!*/ coconut) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final coconut = this;
    if (coconut is CoconutTest1 /*!*/) {
      return (test1 ?? orElse)(coconut);
    } else if (coconut is CoconutTest2 /*!*/) {
      return (test2 ?? orElse)(coconut);
    } else if (coconut is CoconutHold /*!*/) {
      return (hold ?? orElse)(coconut);
    } else {
      throw AssertionError();
    }
  }
}

class CoconutTest1 extends Coconut {
  CoconutTest1({
    @required this.x,
    @required this.y,
  });

  final int /*?*/ x;
  final double /*?*/ y;

  @override
  String /*!*/ toString() => 'Coconut.test1(x: $x, y: $y)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        x,
        y,
      ];
}

class CoconutTest2 extends Coconut {
  CoconutTest2({
    @required this.x,
    @required this.y,
  });

  final int /*?*/ x;
  final double /*?*/ y;

  @override
  String /*!*/ toString() => 'Coconut.test2(x: $x, y: $y)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        x,
        y,
      ];
}

class CoconutHold extends Coconut {
  CoconutHold({
    @required this.apple,
    @required this.banana,
    @required this.count,
  });

  final Apple /*?*/ apple;
  final Banana /*?*/ banana;
  final int /*?*/ count;

  @override
  String /*!*/ toString() =>
      'Coconut.hold(apple: $apple, banana: $banana, count: $count)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        apple,
        banana,
        count,
      ];
}
