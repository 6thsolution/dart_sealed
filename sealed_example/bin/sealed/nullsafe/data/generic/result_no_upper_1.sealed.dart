// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_no_upper_1.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [Object]?, [E] extends [Object]?> {
///
/// ([ResultSuccess] success){[D] data} with data equality
///
/// ([ResultError] error){[E] exception} with data equality
///
/// }
@immutable
@SealedManifest(_Result)
abstract class Result<D extends Object?, E extends Object?> {
  const Result._internal();

  const factory Result.success({
    required D data,
  }) = ResultSuccess<D, E>;

  const factory Result.error({
    required E exception,
  }) = ResultError<D, E>;

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
      return success != null ? success(result) : orElse(result);
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orElse(result);
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

  void whenPartial({
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
}

/// (([ResultSuccess] : [Result])<[D] extends [Object]?, [E] extends [Object]?> success){[D] data}
///
/// with data equality
@immutable
class ResultSuccess<D extends Object?, E extends Object?> extends Result<D, E>
    with EquatableMixin {
  const ResultSuccess({
    required this.data,
  }) : super._internal();

  final D data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

/// (([ResultError] : [Result])<[D] extends [Object]?, [E] extends [Object]?> error){[E] exception}
///
/// with data equality
@immutable
class ResultError<D extends Object?, E extends Object?> extends Result<D, E>
    with EquatableMixin {
  const ResultError({
    required this.exception,
  }) : super._internal();

  final E exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [
        exception,
      ];
}
