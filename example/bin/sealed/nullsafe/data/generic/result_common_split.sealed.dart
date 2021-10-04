// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_common_split.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultLeftRight]<[D] extends [num]> {
///
/// {[D] data}
///
/// ([ResultLeftRightSuccessLeft] successLeft){[D] data} with data equality
///
/// ([ResultLeftRightSuccessRight] successRight){[D] data} with data equality
///
/// }
@SealedManifest(_ResultLeftRight)
abstract class ResultLeftRight<D extends num> {
  const ResultLeftRight._internal();

  D get data;

  const factory ResultLeftRight.successLeft({
    required D data,
  }) = ResultLeftRightSuccessLeft<D>;

  const factory ResultLeftRight.successRight({
    required D data,
  }) = ResultLeftRightSuccessRight<D>;

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
    required R Function(D data) successLeft,
    required R Function(D data) successRight,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft(resultLeftRight.data);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight(resultLeftRight.data);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(D data)? successLeft,
    R Function(D data)? successRight,
    required R Function(ResultLeftRight<D> resultLeftRight) orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft != null
          ? successLeft(resultLeftRight.data)
          : orElse(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight != null
          ? successRight(resultLeftRight.data)
          : orElse(resultLeftRight);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(D data)? successLeft,
    void Function(D data)? successRight,
    void Function(ResultLeftRight<D> resultLeftRight)? orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      if (successLeft != null) {
        successLeft(resultLeftRight.data);
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      if (successRight != null) {
        successRight(resultLeftRight.data);
      } else if (orElse != null) {
        orElse(resultLeftRight);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(D data)? successLeft,
    R Function(D data)? successRight,
    R Function(ResultLeftRight<D> resultLeftRight)? orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft != null
          ? successLeft(resultLeftRight.data)
          : orElse?.call(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight != null
          ? successRight(resultLeftRight.data)
          : orElse?.call(resultLeftRight);
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

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
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

  R? mapOrNull<R extends Object?>({
    R Function(ResultLeftRightSuccessLeft<D> successLeft)? successLeft,
    R Function(ResultLeftRightSuccessRight<D> successRight)? successRight,
    R Function(ResultLeftRight<D> resultLeftRight)? orElse,
  }) {
    final resultLeftRight = this;
    if (resultLeftRight is ResultLeftRightSuccessLeft<D>) {
      return successLeft != null
          ? successLeft(resultLeftRight)
          : orElse?.call(resultLeftRight);
    } else if (resultLeftRight is ResultLeftRightSuccessRight<D>) {
      return successRight != null
          ? successRight(resultLeftRight)
          : orElse?.call(resultLeftRight);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultLeftRightSuccessLeft] : [ResultLeftRight])<[D] extends [num]> successLeft){[D] data}
///
/// with data equality
class ResultLeftRightSuccessLeft<D extends num> extends ResultLeftRight<D>
    with EquatableMixin {
  const ResultLeftRightSuccessLeft({
    required this.data,
  }) : super._internal();

  @override
  final D data;

  @override
  String toString() => 'ResultLeftRight.successLeft(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

/// (([ResultLeftRightSuccessRight] : [ResultLeftRight])<[D] extends [num]> successRight){[D] data}
///
/// with data equality
class ResultLeftRightSuccessRight<D extends num> extends ResultLeftRight<D>
    with EquatableMixin {
  const ResultLeftRightSuccessRight({
    required this.data,
  }) : super._internal();

  @override
  final D data;

  @override
  String toString() => 'ResultLeftRight.successRight(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}
