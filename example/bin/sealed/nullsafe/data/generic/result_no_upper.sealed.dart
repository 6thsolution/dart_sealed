// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_no_upper.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

class D extends Object {}

class E extends Object {}

/// Result<D extends Object?, E extends Object?> {
///
/// Success(D data)
///
/// Error(E? exception)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result {
  @factory
  static ResultSuccess success({required D data}) => ResultSuccess(data: data);

  @factory
  static ResultError error({required E? exception}) =>
      ResultError(exception: exception);

  bool isSuccess() => this is ResultSuccess;

  bool isError() => this is ResultError;

  ResultSuccess asSuccess() => this as ResultSuccess;

  ResultError asError() => this as ResultError;

  ResultSuccess? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess ? result : null;
  }

  ResultError? asErrorOrNull() {
    final result = this;
    return result is ResultError ? result : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess success) success,
    required R Function(ResultError error) error,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return success(result);
    } else if (result is ResultError) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess success)? success,
    R Function(ResultError error)? error,
    required R Function(Result result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return (success ?? orElse)(result);
    } else if (result is ResultError) {
      return (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(ResultSuccess success)? success,
    R Function(ResultError error)? error,
    required R orDefault,
  }) {
    final result = this;
    if (result is ResultSuccess) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess extends Result with EquatableMixin {
  ResultSuccess({required this.data});

  final D data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [data];
}

class ResultError extends Result with EquatableMixin {
  ResultError({required this.exception});

  final E? exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [exception];
}
