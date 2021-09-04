// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_common_split.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultLeftRight]<[D] extends [num]> {
///
/// ([ResultLeftRightSuccessLeft] successLeft){} with data equality
///
/// ([ResultLeftRightSuccessRight] successRight){} with data equality
///
/// }
@SealedManifest(_ResultLeftRight)
abstract class ResultLeftRight<D extends num> {
  const ResultLeftRight._internal();

  const factory ResultLeftRight.successLeft() = ResultLeftRightSuccessLeft<D>;

  const factory ResultLeftRight.successRight() = ResultLeftRightSuccessRight<D>;

  bool get isSuccessLeft => this is ResultLeftRightSuccessLeft<D>;

  bool get isSuccessRight => this is ResultLeftRightSuccessRight<D>;

  ResultLeftRightSuccessLeft<D> get asSuccessLeft =>
      this as ResultLeftRightSuccessLeft<D>;

  ResultLeftRightSuccessRight<D> get asSuccessRight =>
      this as ResultLeftRightSuccessRight<D>;

  ResultLeftRightSuccessLeft<D>? get asSuccessLeftOrNull {
    final resultLeftRight = this;
    return resultLeftRight is ResultLeftRightSuccessLeft<D>
        ? resultLeftRight
        : null;
  }

  ResultLeftRightSuccessRight<D>? get asSuccessRightOrNull {
    final resultLeftRight = this;
    return resultLeftRight is ResultLeftRightSuccessRight<D>
        ? resultLeftRight
        : null;
  }

  R when<R extends Object?>({
    required R Function() successLeft,
    required R Function() successRight,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft();
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight();
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? successLeft,
    R Function()? successRight,
    required R Function(ResultLeftRight<D> resultLeftRight) orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft != null ? successLeft() : orElse(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight != null ? successRight() : orElse(resultLeftRight);
    } else {
      throw AssertionError();
    }
  }

  void partialWhen({
    void Function()? successLeft,
    void Function()? successRight,
    void Function(ResultLeftRight<D> resultLeftRight)? orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      if (successLeft != null) {
        successLeft();
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      if (successRight != null) {
        successRight();
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ResultLeftRightSuccessLeft<D> successLeft) successLeft,
    required R Function(ResultLeftRightSuccessRight<D> successRight)
        successRight,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight(resultLeftRight);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ResultLeftRightSuccessLeft<D> successLeft)? successLeft,
    R Function(ResultLeftRightSuccessRight<D> successRight)? successRight,
    required R Function(ResultLeftRight<D> resultLeftRight) orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft != null
          ? successLeft(resultLeftRight)
          : orElse(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight != null
          ? successRight(resultLeftRight)
          : orElse(resultLeftRight);
    } else {
      throw AssertionError();
    }
  }

  void partialMap({
    void Function(ResultLeftRightSuccessLeft<D> successLeft)? successLeft,
    void Function(ResultLeftRightSuccessRight<D> successRight)? successRight,
    void Function(ResultLeftRight<D> resultLeftRight)? orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      if (successLeft != null) {
        successLeft(resultLeftRight);
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      if (successRight != null) {
        successRight(resultLeftRight);
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultLeftRightSuccessLeft] : [ResultLeftRight])<[D] extends [num]> successLeft){}
///
/// with data equality
class ResultLeftRightSuccessLeft<D extends num> extends ResultLeftRight<D>
    with EquatableMixin {
  const ResultLeftRightSuccessLeft() : super._internal();

  @override
  String toString() => 'ResultLeftRight.successLeft()';

  @override
  List<Object?> get props => [];
}

/// (([ResultLeftRightSuccessRight] : [ResultLeftRight])<[D] extends [num]> successRight){}
///
/// with data equality
class ResultLeftRightSuccessRight<D extends num> extends ResultLeftRight<D>
    with EquatableMixin {
  const ResultLeftRightSuccessRight() : super._internal();

  @override
  String toString() => 'ResultLeftRight.successRight()';

  @override
  List<Object?> get props => [];
}
