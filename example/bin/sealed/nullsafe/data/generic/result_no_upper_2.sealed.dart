// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_no_upper_2.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Result<D extends Object?, E extends Object?> {
///
/// Success(D? data)
///
/// Error(E? exception)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result<D extends Object?, E extends Object?> {
  @factory
  static ResultSuccess<D, E> success<D extends Object?, E extends Object?>({
    required D? data,
  }) =>
      ResultSuccess<D, E>(
        data: data,
      );

  @factory
  static ResultError<D, E> error<D extends Object?, E extends Object?>({
    required E? exception,
  }) =>
      ResultError<D, E>(
        exception: exception,
      );

  bool isSuccess() => this is ResultSuccess<D, E>;

  bool isError() => this is ResultError<D, E>;

  ResultSuccess<D, E> asSuccess() => this as ResultSuccess<D, E>;

  ResultError<D, E> asError() => this as ResultError<D, E>;

  ResultSuccess<D, E>? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D, E> ? result : null;
  }

  ResultError<D, E>? asErrorOrNull() {
    final result = this;
    return result is ResultError<D, E> ? result : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess<D, E> success) success,
    required R Function(ResultError<D, E> error) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success(result);
    } else if (result is ResultError<D, E>) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      return (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    required R orDefault,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success?.call(result);
    } else if (result is ResultError<D, E>) {
      return error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      return success(result);
    } else if (result is ResultError<D, E> && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(ResultSuccess<D, E> success) success,
    required void Function(ResultError<D, E> error) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success(result);
    } else if (result is ResultError<D, E>) {
      error(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success?.call(result);
    } else if (result is ResultError<D, E>) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    required void Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      success(result);
    } else if (result is ResultError<D, E> && error != null) {
      error(result);
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess<D extends Object?, E extends Object?> extends Result<D, E>
    with EquatableMixin {
  ResultSuccess({
    required this.data,
  });

  final D? data;

  @override
  String toString() => 'Result.Success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

class ResultError<D extends Object?, E extends Object?> extends Result<D, E>
    with EquatableMixin {
  ResultError({
    required this.exception,
  });

  final E? exception;

  @override
  String toString() => 'Result.Error(exception: $exception)';

  @override
  List<Object?> get props => [
        exception,
      ];
}
