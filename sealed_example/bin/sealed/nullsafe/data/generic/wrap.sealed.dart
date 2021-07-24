// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrap.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Complete]<[T] extends [num]?, [U] extends [Object]> {
///
/// ([CompleteOne] one){} with data equality with wrap
///
/// ([CompleteTwo] two){[T] x, [U] y, [U]? z} with data equality with wrap
///
/// ([CompleteThree] three){[int] a, [T] b} with data equality with wrap
///
/// }
@immutable
@SealedManifest(_Complete)
abstract class Complete<T extends num?, U extends Object> {
  const Complete._internal();

  const factory Complete.one() = CompleteOne<T, U>;

  const factory Complete.two(
    T x,
    U y,
    U? z,
  ) = CompleteTwo<T, U>;

  const factory Complete.three(
    int a,
    T b,
  ) = CompleteThree<T, U>;

  bool isOne() => this is CompleteOne<T, U>;

  bool isTwo() => this is CompleteTwo<T, U>;

  bool isThree() => this is CompleteThree<T, U>;

  CompleteOne<T, U> asOne() => this as CompleteOne<T, U>;

  CompleteTwo<T, U> asTwo() => this as CompleteTwo<T, U>;

  CompleteThree<T, U> asThree() => this as CompleteThree<T, U>;

  CompleteOne<T, U>? asOneOrNull() {
    final complete = this;
    return complete is CompleteOne<T, U> ? complete : null;
  }

  CompleteTwo<T, U>? asTwoOrNull() {
    final complete = this;
    return complete is CompleteTwo<T, U> ? complete : null;
  }

  CompleteThree<T, U>? asThreeOrNull() {
    final complete = this;
    return complete is CompleteThree<T, U> ? complete : null;
  }

  R when<R extends Object?>({
    required R Function() one,
    required R Function(T x, U y, U? z) two,
    required R Function(int a, T b) three,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U>) {
      return one();
    } else if (complete is CompleteTwo<T, U>) {
      return two(complete.x, complete.y, complete.z);
    } else if (complete is CompleteThree<T, U>) {
      return three(complete.a, complete.b);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function()? one,
    R Function(T x, U y, U? z)? two,
    R Function(int a, T b)? three,
    required R Function(Complete<T, U> complete) orElse,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U>) {
      return one != null ? one() : orElse(complete);
    } else if (complete is CompleteTwo<T, U>) {
      return two != null
          ? two(complete.x, complete.y, complete.z)
          : orElse(complete);
    } else if (complete is CompleteThree<T, U>) {
      return three != null ? three(complete.a, complete.b) : orElse(complete);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function()? one,
    R Function(T x, U y, U? z)? two,
    R Function(int a, T b)? three,
    required R orDefault,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U>) {
      return one != null ? one() : orDefault;
    } else if (complete is CompleteTwo<T, U>) {
      return two != null ? two(complete.x, complete.y, complete.z) : orDefault;
    } else if (complete is CompleteThree<T, U>) {
      return three != null ? three(complete.a, complete.b) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? one,
    R Function(T x, U y, U? z)? two,
    R Function(int a, T b)? three,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U>) {
      return one?.call();
    } else if (complete is CompleteTwo<T, U>) {
      return two?.call(complete.x, complete.y, complete.z);
    } else if (complete is CompleteThree<T, U>) {
      return three?.call(complete.a, complete.b);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function()? one,
    R Function(T x, U y, U? z)? two,
    R Function(int a, T b)? three,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U> && one != null) {
      return one();
    } else if (complete is CompleteTwo<T, U> && two != null) {
      return two(complete.x, complete.y, complete.z);
    } else if (complete is CompleteThree<T, U> && three != null) {
      return three(complete.a, complete.b);
    } else {
      throw AssertionError();
    }
  }

  void whenPartial({
    void Function()? one,
    void Function(T x, U y, U? z)? two,
    void Function(int a, T b)? three,
  }) {
    final complete = this;
    if (complete is CompleteOne<T, U>) {
      one?.call();
    } else if (complete is CompleteTwo<T, U>) {
      two?.call(complete.x, complete.y, complete.z);
    } else if (complete is CompleteThree<T, U>) {
      three?.call(complete.a, complete.b);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CompleteOne] : [Complete])<[T] extends [num]?, [U] extends [Object]> one){}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteOne<T extends num?, U extends Object> extends Complete<T, U>
    with EquatableMixin {
  const CompleteOne() : super._internal();

  @override
  String toString() => 'Complete.one()';

  @override
  List<Object?> get props => [];
}

/// (([CompleteTwo] : [Complete])<[T] extends [num]?, [U] extends [Object]> two){[T] x, [U] y, [U]? z}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteTwo<T extends num?, U extends Object> extends Complete<T, U>
    with EquatableMixin {
  const CompleteTwo(
    this.x,
    this.y,
    this.z,
  ) : super._internal();

  final T x;
  final U y;
  final U? z;

  @override
  String toString() => 'Complete.two(x: $x, y: $y, z: $z)';

  @override
  List<Object?> get props => [
        x,
        y,
        z,
      ];
}

/// (([CompleteThree] : [Complete])<[T] extends [num]?, [U] extends [Object]> three){[int] a, [T] b}
///
/// with data equality
///
/// with wrap
@immutable
class CompleteThree<T extends num?, U extends Object> extends Complete<T, U>
    with EquatableMixin {
  const CompleteThree(
    this.a,
    this.b,
  ) : super._internal();

  final int a;
  final T b;

  @override
  String toString() => 'Complete.three(a: $a, b: $b)';

  @override
  List<Object?> get props => [
        a,
        b,
      ];
}
