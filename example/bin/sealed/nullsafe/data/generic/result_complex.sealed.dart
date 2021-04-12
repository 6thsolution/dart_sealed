// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_complex.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

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
abstract class Result<D extends Object?, E extends Base> {
  @factory
  static ResultSuccess<D, E> success<D extends Object?, E extends Base>({
    required D data,
  }) =>
      ResultSuccess<D, E>(
        data: data,
      );

  @factory
  static ResultError<D, E> error<D extends Object?, E extends Base>({
    required E exception,
  }) =>
      ResultError<D, E>(
        exception: exception,
      );

  @factory
  static ResultDummy<D, E> dummy<D extends Object?, E extends Base>({
    required D? data,
  }) =>
      ResultDummy<D, E>(
        data: data,
      );

  @factory
  static ResultPartialSuccess<D, E>
      partialSuccess<D extends Object?, E extends Base>({
    required D data,
    required E? exception,
  }) =>
          ResultPartialSuccess<D, E>(
            data: data,
            exception: exception,
          );

  @factory
  static ResultPartialError<D, E>
      partialError<D extends Object?, E extends Base>({
    required E? e,
    required int code,
  }) =>
          ResultPartialError<D, E>(
            e: e,
            code: code,
          );

  @factory
  static ResultDoubleSuccess<D, E>
      doubleSuccess<D extends Object?, E extends Base>({
    required D data1,
    required D data2,
    required int code,
  }) =>
          ResultDoubleSuccess<D, E>(
            data1: data1,
            data2: data2,
            code: code,
          );

  bool isSuccess() => this is ResultSuccess<D, E>;

  bool isError() => this is ResultError<D, E>;

  bool isDummy() => this is ResultDummy<D, E>;

  bool isPartialSuccess() => this is ResultPartialSuccess<D, E>;

  bool isPartialError() => this is ResultPartialError<D, E>;

  bool isDoubleSuccess() => this is ResultDoubleSuccess<D, E>;

  ResultSuccess<D, E> asSuccess() => this as ResultSuccess<D, E>;

  ResultError<D, E> asError() => this as ResultError<D, E>;

  ResultDummy<D, E> asDummy() => this as ResultDummy<D, E>;

  ResultPartialSuccess<D, E> asPartialSuccess() =>
      this as ResultPartialSuccess<D, E>;

  ResultPartialError<D, E> asPartialError() => this as ResultPartialError<D, E>;

  ResultDoubleSuccess<D, E> asDoubleSuccess() =>
      this as ResultDoubleSuccess<D, E>;

  ResultSuccess<D, E>? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D, E> ? result : null;
  }

  ResultError<D, E>? asErrorOrNull() {
    final result = this;
    return result is ResultError<D, E> ? result : null;
  }

  ResultDummy<D, E>? asDummyOrNull() {
    final result = this;
    return result is ResultDummy<D, E> ? result : null;
  }

  ResultPartialSuccess<D, E>? asPartialSuccessOrNull() {
    final result = this;
    return result is ResultPartialSuccess<D, E> ? result : null;
  }

  ResultPartialError<D, E>? asPartialErrorOrNull() {
    final result = this;
    return result is ResultPartialError<D, E> ? result : null;
  }

  ResultDoubleSuccess<D, E>? asDoubleSuccessOrNull() {
    final result = this;
    return result is ResultDoubleSuccess<D, E> ? result : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess<D, E> success) success,
    required R Function(ResultError<D, E> error) error,
    required R Function(ResultDummy<D, E> dummy) dummy,
    required R Function(ResultPartialSuccess<D, E> partialSuccess)
        partialSuccess,
    required R Function(ResultPartialError<D, E> partialError) partialError,
    required R Function(ResultDoubleSuccess<D, E> doubleSuccess) doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success(result);
    } else if (result is ResultError<D, E>) {
      return error(result);
    } else if (result is ResultDummy<D, E>) {
      return dummy(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      return partialSuccess(result);
    } else if (result is ResultPartialError<D, E>) {
      return partialError(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      return doubleSuccess(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultDummy<D, E> dummy)? dummy,
    R Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    R Function(ResultPartialError<D, E> partialError)? partialError,
    R Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      return (error ?? orElse)(result);
    } else if (result is ResultDummy<D, E>) {
      return (dummy ?? orElse)(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      return (partialSuccess ?? orElse)(result);
    } else if (result is ResultPartialError<D, E>) {
      return (partialError ?? orElse)(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      return (doubleSuccess ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultDummy<D, E> dummy)? dummy,
    R Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    R Function(ResultPartialError<D, E> partialError)? partialError,
    R Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
    required R orDefault,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orDefault;
    } else if (result is ResultDummy<D, E>) {
      return dummy != null ? dummy(result) : orDefault;
    } else if (result is ResultPartialSuccess<D, E>) {
      return partialSuccess != null ? partialSuccess(result) : orDefault;
    } else if (result is ResultPartialError<D, E>) {
      return partialError != null ? partialError(result) : orDefault;
    } else if (result is ResultDoubleSuccess<D, E>) {
      return doubleSuccess != null ? doubleSuccess(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultDummy<D, E> dummy)? dummy,
    R Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    R Function(ResultPartialError<D, E> partialError)? partialError,
    R Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success?.call(result);
    } else if (result is ResultError<D, E>) {
      return error?.call(result);
    } else if (result is ResultDummy<D, E>) {
      return dummy?.call(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      return partialSuccess?.call(result);
    } else if (result is ResultPartialError<D, E>) {
      return partialError?.call(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      return doubleSuccess?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultDummy<D, E> dummy)? dummy,
    R Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    R Function(ResultPartialError<D, E> partialError)? partialError,
    R Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      return success(result);
    } else if (result is ResultError<D, E> && error != null) {
      return error(result);
    } else if (result is ResultDummy<D, E> && dummy != null) {
      return dummy(result);
    } else if (result is ResultPartialSuccess<D, E> && partialSuccess != null) {
      return partialSuccess(result);
    } else if (result is ResultPartialError<D, E> && partialError != null) {
      return partialError(result);
    } else if (result is ResultDoubleSuccess<D, E> && doubleSuccess != null) {
      return doubleSuccess(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(ResultSuccess<D, E> success) success,
    required void Function(ResultError<D, E> error) error,
    required void Function(ResultDummy<D, E> dummy) dummy,
    required void Function(ResultPartialSuccess<D, E> partialSuccess)
        partialSuccess,
    required void Function(ResultPartialError<D, E> partialError) partialError,
    required void Function(ResultDoubleSuccess<D, E> doubleSuccess)
        doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success(result);
    } else if (result is ResultError<D, E>) {
      error(result);
    } else if (result is ResultDummy<D, E>) {
      dummy(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      partialSuccess(result);
    } else if (result is ResultPartialError<D, E>) {
      partialError(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      doubleSuccess(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultDummy<D, E> dummy)? dummy,
    void Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    void Function(ResultPartialError<D, E> partialError)? partialError,
    void Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success?.call(result);
    } else if (result is ResultError<D, E>) {
      error?.call(result);
    } else if (result is ResultDummy<D, E>) {
      dummy?.call(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      partialSuccess?.call(result);
    } else if (result is ResultPartialError<D, E>) {
      partialError?.call(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      doubleSuccess?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultDummy<D, E> dummy)? dummy,
    void Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    void Function(ResultPartialError<D, E> partialError)? partialError,
    void Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
    required void Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      (error ?? orElse)(result);
    } else if (result is ResultDummy<D, E>) {
      (dummy ?? orElse)(result);
    } else if (result is ResultPartialSuccess<D, E>) {
      (partialSuccess ?? orElse)(result);
    } else if (result is ResultPartialError<D, E>) {
      (partialError ?? orElse)(result);
    } else if (result is ResultDoubleSuccess<D, E>) {
      (doubleSuccess ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultDummy<D, E> dummy)? dummy,
    void Function(ResultPartialSuccess<D, E> partialSuccess)? partialSuccess,
    void Function(ResultPartialError<D, E> partialError)? partialError,
    void Function(ResultDoubleSuccess<D, E> doubleSuccess)? doubleSuccess,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      success(result);
    } else if (result is ResultError<D, E> && error != null) {
      error(result);
    } else if (result is ResultDummy<D, E> && dummy != null) {
      dummy(result);
    } else if (result is ResultPartialSuccess<D, E> && partialSuccess != null) {
      partialSuccess(result);
    } else if (result is ResultPartialError<D, E> && partialError != null) {
      partialError(result);
    } else if (result is ResultDoubleSuccess<D, E> && doubleSuccess != null) {
      doubleSuccess(result);
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess<D extends Object?, E extends Base> extends Result<D, E>
    with EquatableMixin {
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

class ResultError<D extends Object?, E extends Base> extends Result<D, E>
    with EquatableMixin {
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

class ResultDummy<D extends Object?, E extends Base> extends Result<D, E>
    with EquatableMixin {
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

class ResultPartialSuccess<D extends Object?, E extends Base>
    extends Result<D, E> with EquatableMixin {
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

class ResultPartialError<D extends Object?, E extends Base> extends Result<D, E>
    with EquatableMixin {
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

class ResultDoubleSuccess<D extends Object?, E extends Base>
    extends Result<D, E> with EquatableMixin {
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
