// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_multi_3.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Result<D extends num, E extends Object> {
///
/// (ResultSuccess success){D? data} with data equality
///
/// (ResultError error){E? exception} with data equality
///
/// (ResultMixed mixed){D? data, E? exception} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<D extends num, E extends Object> {
  @factory
  static ResultSuccess<D, E> success<D extends num, E extends Object>({
    required D? data,
  }) =>
      ResultSuccess<D, E>(
        data: data,
      );

  @factory
  static ResultError<D, E> error<D extends num, E extends Object>({
    required E? exception,
  }) =>
      ResultError<D, E>(
        exception: exception,
      );

  @factory
  static ResultMixed<D, E> mixed<D extends num, E extends Object>({
    required D? data,
    required E? exception,
  }) =>
      ResultMixed<D, E>(
        data: data,
        exception: exception,
      );

  bool isSuccess() => this is ResultSuccess<D, E>;

  bool isError() => this is ResultError<D, E>;

  bool isMixed() => this is ResultMixed<D, E>;

  ResultSuccess<D, E> asSuccess() => this as ResultSuccess<D, E>;

  ResultError<D, E> asError() => this as ResultError<D, E>;

  ResultMixed<D, E> asMixed() => this as ResultMixed<D, E>;

  ResultSuccess<D, E>? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D, E> ? result : null;
  }

  ResultError<D, E>? asErrorOrNull() {
    final result = this;
    return result is ResultError<D, E> ? result : null;
  }

  ResultMixed<D, E>? asMixedOrNull() {
    final result = this;
    return result is ResultMixed<D, E> ? result : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess<D, E> success) success,
    required R Function(ResultError<D, E> error) error,
    required R Function(ResultMixed<D, E> mixed) mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success(result);
    } else if (result is ResultError<D, E>) {
      return error(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      return (error ?? orElse)(result);
    } else if (result is ResultMixed<D, E>) {
      return (mixed ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
    required R orDefault,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orDefault;
    } else if (result is ResultMixed<D, E>) {
      return mixed != null ? mixed(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success?.call(result);
    } else if (result is ResultError<D, E>) {
      return error?.call(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      return success(result);
    } else if (result is ResultError<D, E> && error != null) {
      return error(result);
    } else if (result is ResultMixed<D, E> && mixed != null) {
      return mixed(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(ResultSuccess<D, E> success) success,
    required void Function(ResultError<D, E> error) error,
    required void Function(ResultMixed<D, E> mixed) mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success(result);
    } else if (result is ResultError<D, E>) {
      error(result);
    } else if (result is ResultMixed<D, E>) {
      mixed(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultMixed<D, E> mixed)? mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      success?.call(result);
    } else if (result is ResultError<D, E>) {
      error?.call(result);
    } else if (result is ResultMixed<D, E>) {
      mixed?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultMixed<D, E> mixed)? mixed,
    required void Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      (success ?? orElse)(result);
    } else if (result is ResultError<D, E>) {
      (error ?? orElse)(result);
    } else if (result is ResultMixed<D, E>) {
      (mixed ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultMixed<D, E> mixed)? mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E> && success != null) {
      success(result);
    } else if (result is ResultError<D, E> && error != null) {
      error(result);
    } else if (result is ResultMixed<D, E> && mixed != null) {
      mixed(result);
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess<D extends num, E extends Object> extends Result<D, E>
    with EquatableMixin {
  ResultSuccess({
    required this.data,
  });

  final D? data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

class ResultError<D extends num, E extends Object> extends Result<D, E>
    with EquatableMixin {
  ResultError({
    required this.exception,
  });

  final E? exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [
        exception,
      ];
}

class ResultMixed<D extends num, E extends Object> extends Result<D, E>
    with EquatableMixin {
  ResultMixed({
    required this.data,
    required this.exception,
  });

  final D? data;
  final E? exception;

  @override
  String toString() => 'Result.mixed(data: $data, exception: $exception)';

  @override
  List<Object?> get props => [
        data,
        exception,
      ];
}
