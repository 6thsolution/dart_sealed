// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'wrap.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Complete] {
///
/// ([CompleteOne] one){} with data equality with wrap
///
/// ([CompleteTwo] two){[int]? x} with data equality with wrap
///
/// ([CompleteThree] three){[double]? y, [double]? z} with data equality with wrap
///
/// }
@immutable
@SealedManifest(_Complete)
abstract class Complete {
  const Complete._internal();

  @factory
  static CompleteOne /*!*/ one() => CompleteOne();

  @factory
  static CompleteTwo /*!*/ two({
    @required int /*?*/ x,
  }) =>
      CompleteTwo(
        x: x,
      );

  @factory
  static CompleteThree /*!*/ three({
    @required double /*?*/ y,
    @required double /*?*/ z,
  }) =>
      CompleteThree(
        y: y,
        z: z,
      );

  bool /*!*/ isOne() => this is CompleteOne;

  bool /*!*/ isTwo() => this is CompleteTwo;

  bool /*!*/ isThree() => this is CompleteThree;

  CompleteOne /*!*/ asOne() => this as CompleteOne;

  CompleteTwo /*!*/ asTwo() => this as CompleteTwo;

  CompleteThree /*!*/ asThree() => this as CompleteThree;

  CompleteOne /*?*/ asOneOrNull() {
    final complete = this;
    return complete is CompleteOne ? complete : null;
  }

  CompleteTwo /*?*/ asTwoOrNull() {
    final complete = this;
    return complete is CompleteTwo ? complete : null;
  }

  CompleteThree /*?*/ asThreeOrNull() {
    final complete = this;
    return complete is CompleteThree ? complete : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(CompleteOne /*!*/ one) /*!*/ one,
    @required R Function(CompleteTwo /*!*/ two) /*!*/ two,
    @required R Function(CompleteThree /*!*/ three) /*!*/ three,
  }) {
    assert(one != null);
    assert(two != null);
    assert(three != null);
    final complete = this;
    if (complete is CompleteOne) {
      return one(complete);
    } else if (complete is CompleteTwo) {
      return two(complete);
    } else if (complete is CompleteThree) {
      return three(complete);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(CompleteOne /*!*/ one) /*?*/ one,
    R Function(CompleteTwo /*!*/ two) /*?*/ two,
    R Function(CompleteThree /*!*/ three) /*?*/ three,
    @required R Function(Complete /*!*/ complete) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final complete = this;
    if (complete is CompleteOne) {
      return one != null ? one(complete) : orElse(complete);
    } else if (complete is CompleteTwo) {
      return two != null ? two(complete) : orElse(complete);
    } else if (complete is CompleteThree) {
      return three != null ? three(complete) : orElse(complete);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(CompleteOne /*!*/ one) /*?*/ one,
    R Function(CompleteTwo /*!*/ two) /*?*/ two,
    R Function(CompleteThree /*!*/ three) /*?*/ three,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final complete = this;
    if (complete is CompleteOne) {
      return one != null ? one(complete) : orDefault;
    } else if (complete is CompleteTwo) {
      return two != null ? two(complete) : orDefault;
    } else if (complete is CompleteThree) {
      return three != null ? three(complete) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(CompleteOne /*!*/ one) /*?*/ one,
    R Function(CompleteTwo /*!*/ two) /*?*/ two,
    R Function(CompleteThree /*!*/ three) /*?*/ three,
  }) {
    final complete = this;
    if (complete is CompleteOne) {
      return one?.call(complete);
    } else if (complete is CompleteTwo) {
      return two?.call(complete);
    } else if (complete is CompleteThree) {
      return three?.call(complete);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(CompleteOne /*!*/ one) /*?*/ one,
    R Function(CompleteTwo /*!*/ two) /*?*/ two,
    R Function(CompleteThree /*!*/ three) /*?*/ three,
  }) {
    final complete = this;
    if (complete is CompleteOne && one != null) {
      return one(complete);
    } else if (complete is CompleteTwo && two != null) {
      return two(complete);
    } else if (complete is CompleteThree && three != null) {
      return three(complete);
    } else {
      throw AssertionError();
    }
  }

  void whenPartial({
    void Function(CompleteOne /*!*/ one) /*?*/ one,
    void Function(CompleteTwo /*!*/ two) /*?*/ two,
    void Function(CompleteThree /*!*/ three) /*?*/ three,
  }) {
    final complete = this;
    if (complete is CompleteOne) {
      one?.call(complete);
    } else if (complete is CompleteTwo) {
      two?.call(complete);
    } else if (complete is CompleteThree) {
      three?.call(complete);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CompleteOne] : [Complete]) one){}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteOne extends Complete with EquatableMixin {
  const CompleteOne() : super._internal();

  @factory
  CompleteOne /*!*/ copy() => CompleteOne();

  @override
  String /*!*/ toString() => 'Complete.one()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

/// (([CompleteTwo] : [Complete]) two){[int]? x}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteTwo extends Complete with EquatableMixin {
  const CompleteTwo({
    @required this.x,
  }) : super._internal();

  final int /*?*/ x;

  @override
  String /*!*/ toString() => 'Complete.two(x: $x)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        x,
      ];
}

/// (([CompleteThree] : [Complete]) three){[double]? y, [double]? z}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteThree extends Complete with EquatableMixin {
  const CompleteThree({
    @required this.y,
    @required this.z,
  }) : super._internal();

  final double /*?*/ y;
  final double /*?*/ z;

  @override
  String /*!*/ toString() => 'Complete.three(y: $y, z: $z)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        y,
        z,
      ];
}

/// [Partial] {
///
/// ([PartialOne] one){} with data equality
///
/// ([PartialTwo] two){[int]? x} with data equality
///
/// ([PartialThree] three){[double]? y, [double]? z} with data equality with wrap
///
/// }
@immutable
@SealedManifest(_Partial)
abstract class Partial {
  const Partial._internal();

  @factory
  static PartialOne /*!*/ one() => PartialOne();

  @factory
  static PartialTwo /*!*/ two({
    @required int /*?*/ x,
  }) =>
      PartialTwo(
        x: x,
      );

  @factory
  static PartialThree /*!*/ three({
    @required double /*?*/ y,
    @required double /*?*/ z,
  }) =>
      PartialThree(
        y: y,
        z: z,
      );

  bool /*!*/ isOne() => this is PartialOne;

  bool /*!*/ isTwo() => this is PartialTwo;

  bool /*!*/ isThree() => this is PartialThree;

  PartialOne /*!*/ asOne() => this as PartialOne;

  PartialTwo /*!*/ asTwo() => this as PartialTwo;

  PartialThree /*!*/ asThree() => this as PartialThree;

  PartialOne /*?*/ asOneOrNull() {
    final partial = this;
    return partial is PartialOne ? partial : null;
  }

  PartialTwo /*?*/ asTwoOrNull() {
    final partial = this;
    return partial is PartialTwo ? partial : null;
  }

  PartialThree /*?*/ asThreeOrNull() {
    final partial = this;
    return partial is PartialThree ? partial : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(PartialOne /*!*/ one) /*!*/ one,
    @required R Function(PartialTwo /*!*/ two) /*!*/ two,
    @required R Function(PartialThree /*!*/ three) /*!*/ three,
  }) {
    assert(one != null);
    assert(two != null);
    assert(three != null);
    final partial = this;
    if (partial is PartialOne) {
      return one(partial);
    } else if (partial is PartialTwo) {
      return two(partial);
    } else if (partial is PartialThree) {
      return three(partial);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(PartialOne /*!*/ one) /*?*/ one,
    R Function(PartialTwo /*!*/ two) /*?*/ two,
    R Function(PartialThree /*!*/ three) /*?*/ three,
    @required R Function(Partial /*!*/ partial) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final partial = this;
    if (partial is PartialOne) {
      return one != null ? one(partial) : orElse(partial);
    } else if (partial is PartialTwo) {
      return two != null ? two(partial) : orElse(partial);
    } else if (partial is PartialThree) {
      return three != null ? three(partial) : orElse(partial);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(PartialOne /*!*/ one) /*?*/ one,
    R Function(PartialTwo /*!*/ two) /*?*/ two,
    R Function(PartialThree /*!*/ three) /*?*/ three,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final partial = this;
    if (partial is PartialOne) {
      return one != null ? one(partial) : orDefault;
    } else if (partial is PartialTwo) {
      return two != null ? two(partial) : orDefault;
    } else if (partial is PartialThree) {
      return three != null ? three(partial) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(PartialOne /*!*/ one) /*?*/ one,
    R Function(PartialTwo /*!*/ two) /*?*/ two,
    R Function(PartialThree /*!*/ three) /*?*/ three,
  }) {
    final partial = this;
    if (partial is PartialOne) {
      return one?.call(partial);
    } else if (partial is PartialTwo) {
      return two?.call(partial);
    } else if (partial is PartialThree) {
      return three?.call(partial);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(PartialOne /*!*/ one) /*?*/ one,
    R Function(PartialTwo /*!*/ two) /*?*/ two,
    R Function(PartialThree /*!*/ three) /*?*/ three,
  }) {
    final partial = this;
    if (partial is PartialOne && one != null) {
      return one(partial);
    } else if (partial is PartialTwo && two != null) {
      return two(partial);
    } else if (partial is PartialThree && three != null) {
      return three(partial);
    } else {
      throw AssertionError();
    }
  }

  void whenPartial({
    void Function(PartialOne /*!*/ one) /*?*/ one,
    void Function(PartialTwo /*!*/ two) /*?*/ two,
    void Function(PartialThree /*!*/ three) /*?*/ three,
  }) {
    final partial = this;
    if (partial is PartialOne) {
      one?.call(partial);
    } else if (partial is PartialTwo) {
      two?.call(partial);
    } else if (partial is PartialThree) {
      three?.call(partial);
    } else {
      throw AssertionError();
    }
  }
}

/// (([PartialOne] : [Partial]) one){}
///
/// with data equality
@immutable
class PartialOne extends Partial with EquatableMixin {
  const PartialOne() : super._internal();

  @factory
  PartialOne /*!*/ copy() => PartialOne();

  @override
  String /*!*/ toString() => 'Partial.one()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

/// (([PartialTwo] : [Partial]) two){[int]? x}
///
/// with data equality
@immutable
class PartialTwo extends Partial with EquatableMixin {
  const PartialTwo({
    @required this.x,
  }) : super._internal();

  final int /*?*/ x;

  @override
  String /*!*/ toString() => 'Partial.two(x: $x)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        x,
      ];
}

/// (([PartialThree] : [Partial]) three){[double]? y, [double]? z}
///
/// with data equality
///
/// with wrap
@immutable
class PartialThree extends Partial with EquatableMixin {
  const PartialThree({
    @required this.y,
    @required this.z,
  }) : super._internal();

  final double /*?*/ y;
  final double /*?*/ z;

  @override
  String /*!*/ toString() => 'Partial.three(y: $y, z: $z)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        y,
        z,
      ];
}
