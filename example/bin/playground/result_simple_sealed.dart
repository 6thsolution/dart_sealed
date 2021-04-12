// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:equatable/equatable.dart';
// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

import 'package:meta/meta.dart';

class DBase {}

class EBase {}

// ignore: unused_element
abstract class _Result<D extends DBase, E extends EBase> {
  void success(D data);

  void error(E exception);
}

/// Result<D extends DBase, E extends EBase> {
///
/// Success(D data)
///
/// Error(E exception)
///
/// }
///
/// with data equality.
abstract class Result<D extends DBase, E extends EBase> {
  @factory
  static ResultSuccess<D, E> success<D extends DBase, E extends EBase>({
    required D data,
  }) =>
      ResultSuccess<D, E>(
        data: data,
      );

  @factory
  static ResultError<D, E> error<D extends DBase, E extends EBase>({
    required E exception,
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
}

class ResultSuccess<D extends DBase, E extends EBase> extends Result<D, E>
    with EquatableMixin {
  ResultSuccess({required this.data});

  final D data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [data];
}

class ResultError<D extends DBase, E extends EBase> extends Result<D, E>
    with EquatableMixin {
  ResultError({required this.exception});

  final E exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [exception];
}
