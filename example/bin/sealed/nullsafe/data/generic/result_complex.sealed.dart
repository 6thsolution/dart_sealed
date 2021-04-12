// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_complex.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

class D extends Object {}

class E extends Base {}

/// Result<D extends Object?, E extends Base> {
///
/// Success(D data)
///
/// Error(E exception)
///
/// Dummy(D? data)
///
/// PartialSuccess(D data, E? exception)
///
/// PartialError(E? e, int code)
///
/// DoubleSuccess(D data1, D data2, int code)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result {
  @factory
  static ResultSuccess success({
    required D data,
  }) =>
      ResultSuccess(
        data: data,
      );

  @factory
  static ResultError error({
    required E exception,
  }) =>
      ResultError(
        exception: exception,
      );

  @factory
  static ResultDummy dummy({
    required D? data,
  }) =>
      ResultDummy(
        data: data,
      );

  @factory
  static ResultPartialSuccess partialSuccess({
    required D data,
    required E? exception,
  }) =>
      ResultPartialSuccess(
        data: data,
        exception: exception,
      );

  @factory
  static ResultPartialError partialError({
    required E? e,
    required int code,
  }) =>
      ResultPartialError(
        e: e,
        code: code,
      );

  @factory
  static ResultDoubleSuccess doubleSuccess({
    required D data1,
    required D data2,
    required int code,
  }) =>
      ResultDoubleSuccess(
        data1: data1,
        data2: data2,
        code: code,
      );

  bool isSuccess() => this is ResultSuccess;

  bool isError() => this is ResultError;

  bool isDummy() => this is ResultDummy;

  bool isPartialSuccess() => this is ResultPartialSuccess;

  bool isPartialError() => this is ResultPartialError;

  bool isDoubleSuccess() => this is ResultDoubleSuccess;

  ResultSuccess asSuccess() => this as ResultSuccess;

  ResultError asError() => this as ResultError;

  ResultDummy asDummy() => this as ResultDummy;

  ResultPartialSuccess asPartialSuccess() => this as ResultPartialSuccess;

  ResultPartialError asPartialError() => this as ResultPartialError;

  ResultDoubleSuccess asDoubleSuccess() => this as ResultDoubleSuccess;

  ResultSuccess? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess ? result : null;
  }

  ResultError? asErrorOrNull() {
    final result = this;
    return result is ResultError ? result : null;
  }

  ResultDummy? asDummyOrNull() {
    final result = this;
    return result is ResultDummy ? result : null;
  }

  ResultPartialSuccess? asPartialSuccessOrNull() {
    final result = this;
    return result is ResultPartialSuccess ? result : null;
  }

  ResultPartialError? asPartialErrorOrNull() {
    final result = this;
    return result is ResultPartialError ? result : null;
  }

  ResultDoubleSuccess? asDoubleSuccessOrNull() {
    final result = this;
    return result is ResultDoubleSuccess ? result : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess success) success,
    required R Function(ResultError error) error,
    required R Function(ResultDummy dummy) dummy,
    required R Function(ResultPartialSuccess partialSuccess) partialSuccess,
    required R Function(ResultPartialError partialError) partialError,
    required R Function(ResultDoubleSuccess doubleSuccess) doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return success(result);
    } else if (result is ResultError) {
      return error(result);
    } else if (result is ResultDummy) {
      return dummy(result);
    } else if (result is ResultPartialSuccess) {
      return partialSuccess(result);
    } else if (result is ResultPartialError) {
      return partialError(result);
    } else if (result is ResultDoubleSuccess) {
      return doubleSuccess(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess success)? success,
    R Function(ResultError error)? error,
    R Function(ResultDummy dummy)? dummy,
    R Function(ResultPartialSuccess partialSuccess)? partialSuccess,
    R Function(ResultPartialError partialError)? partialError,
    R Function(ResultDoubleSuccess doubleSuccess)? doubleSuccess,
    required R Function(Result result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return (success ?? orElse)(result);
    } else if (result is ResultError) {
      return (error ?? orElse)(result);
    } else if (result is ResultDummy) {
      return (dummy ?? orElse)(result);
    } else if (result is ResultPartialSuccess) {
      return (partialSuccess ?? orElse)(result);
    } else if (result is ResultPartialError) {
      return (partialError ?? orElse)(result);
    } else if (result is ResultDoubleSuccess) {
      return (doubleSuccess ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(ResultSuccess success)? success,
    R Function(ResultError error)? error,
    R Function(ResultDummy dummy)? dummy,
    R Function(ResultPartialSuccess partialSuccess)? partialSuccess,
    R Function(ResultPartialError partialError)? partialError,
    R Function(ResultDoubleSuccess doubleSuccess)? doubleSuccess,
    required R orDefault,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError) {
      return error != null ? error(result) : orDefault;
    } else if (result is ResultDummy) {
      return dummy != null ? dummy(result) : orDefault;
    } else if (result is ResultPartialSuccess) {
      return partialSuccess != null ? partialSuccess(result) : orDefault;
    } else if (result is ResultPartialError) {
      return partialError != null ? partialError(result) : orDefault;
    } else if (result is ResultDoubleSuccess) {
      return doubleSuccess != null ? doubleSuccess(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess extends Result with EquatableMixin {
  ResultSuccess({
    required this.data,
  });

  final D data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

class ResultError extends Result with EquatableMixin {
  ResultError({
    required this.exception,
  });

  final E exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [
        exception,
      ];
}

class ResultDummy extends Result with EquatableMixin {
  ResultDummy({
    required this.data,
  });

  final D? data;

  @override
  String toString() => 'Result.dummy(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

class ResultPartialSuccess extends Result with EquatableMixin {
  ResultPartialSuccess({
    required this.data,
    required this.exception,
  });

  final D data;
  final E? exception;

  @override
  String toString() =>
      'Result.partialSuccess(data: $data, exception: $exception)';

  @override
  List<Object?> get props => [
        data,
        exception,
      ];
}

class ResultPartialError extends Result with EquatableMixin {
  ResultPartialError({
    required this.e,
    required this.code,
  });

  final E? e;
  final int code;

  @override
  String toString() => 'Result.partialError(e: $e, code: $code)';

  @override
  List<Object?> get props => [
        e,
        code,
      ];
}

class ResultDoubleSuccess extends Result with EquatableMixin {
  ResultDoubleSuccess({
    required this.data1,
    required this.data2,
    required this.code,
  });

  final D data1;
  final D data2;
  final int code;

  @override
  String toString() =>
      'Result.doubleSuccess(data1: $data1, data2: $data2, code: $code)';

  @override
  List<Object?> get props => [
        data1,
        data2,
        code,
      ];
}
