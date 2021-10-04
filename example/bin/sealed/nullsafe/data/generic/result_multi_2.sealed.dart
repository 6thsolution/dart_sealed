// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_multi_2.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [num]?, [E] extends [Object]?> {
///
/// ([ResultSuccess] success){[D] data} with data equality
///
/// ([ResultError] error){[E] exception} with data equality
///
/// ([ResultMixed] mixed){[D] data, [E] exception} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<D extends num?, E extends Object?> {
  const Result._internal();

  const factory Result.success({
    required D data,
  }) = ResultSuccess<D, E>;

  const factory Result.error({
    required E exception,
  }) = ResultError<D, E>;

  const factory Result.mixed({
    required D data,
    required E exception,
  }) = ResultMixed<D, E>;

  bool get isSuccess => this is ResultSuccess<D, E>;

  bool get isError => this is ResultError<D, E>;

  bool get isMixed => this is ResultMixed<D, E>;

  ResultSuccess<D, E> get asSuccess => this as ResultSuccess<D, E>;

  ResultError<D, E> get asError => this as ResultError<D, E>;

  ResultMixed<D, E> get asMixed => this as ResultMixed<D, E>;

  ResultSuccess<D, E>? get asSuccessOrNull {
    final result = this;
    return result is ResultSuccess<D, E> ? result : null;
  }

  ResultError<D, E>? get asErrorOrNull {
    final result = this;
    return result is ResultError<D, E> ? result : null;
  }

  ResultMixed<D, E>? get asMixedOrNull {
    final result = this;
    return result is ResultMixed<D, E> ? result : null;
  }

  R when<R extends Object?>({
    required R Function(D data) success,
    required R Function(E exception) error,
    required R Function(D data, E exception) mixed,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success(result.data);
    } else if (result is ResultError<D, E>) {
      return error(result.exception);
    } else if (result is ResultMixed<D, E>) {
      return mixed(result.data, result.exception);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(D data)? success,
    R Function(E exception)? error,
    R Function(D data, E exception)? mixed,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result.data) : orElse(result);
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result.exception) : orElse(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed != null
          ? mixed(result.data, result.exception)
          : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(D data)? success,
    void Function(E exception)? error,
    void Function(D data, E exception)? mixed,
    void Function(Result<D, E> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      if (success != null) {
        success(result.data);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultError<D, E>) {
      if (error != null) {
        error(result.exception);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultMixed<D, E>) {
      if (mixed != null) {
        mixed(result.data, result.exception);
      } else if (orElse != null) {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(D data)? success,
    R Function(E exception)? error,
    R Function(D data, E exception)? mixed,
    R Function(Result<D, E> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result.data) : orElse?.call(result);
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result.exception) : orElse?.call(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed != null
          ? mixed(result.data, result.exception)
          : orElse?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
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

  R maybeMap<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result) : orElse(result);
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orElse(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed != null ? mixed(result) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ResultSuccess<D, E> success)? success,
    void Function(ResultError<D, E> error)? error,
    void Function(ResultMixed<D, E> mixed)? mixed,
    void Function(Result<D, E> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      if (success != null) {
        success(result);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultError<D, E>) {
      if (error != null) {
        error(result);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultMixed<D, E>) {
      if (mixed != null) {
        mixed(result);
      } else if (orElse != null) {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ResultSuccess<D, E> success)? success,
    R Function(ResultError<D, E> error)? error,
    R Function(ResultMixed<D, E> mixed)? mixed,
    R Function(Result<D, E> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D, E>) {
      return success != null ? success(result) : orElse?.call(result);
    } else if (result is ResultError<D, E>) {
      return error != null ? error(result) : orElse?.call(result);
    } else if (result is ResultMixed<D, E>) {
      return mixed != null ? mixed(result) : orElse?.call(result);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultSuccess] : [Result])<[D] extends [num]?, [E] extends [Object]?> success){[D] data}
///
/// with data equality
class ResultSuccess<D extends num?, E extends Object?> extends Result<D, E>
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

/// (([ResultError] : [Result])<[D] extends [num]?, [E] extends [Object]?> error){[E] exception}
///
/// with data equality
class ResultError<D extends num?, E extends Object?> extends Result<D, E>
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

/// (([ResultMixed] : [Result])<[D] extends [num]?, [E] extends [Object]?> mixed){[D] data, [E] exception}
///
/// with data equality
class ResultMixed<D extends num?, E extends Object?> extends Result<D, E>
    with EquatableMixin {
  const ResultMixed({
    required this.data,
    required this.exception,
  }) : super._internal();

  final D data;
  final E exception;

  @override
  String toString() => 'Result.mixed(data: $data, exception: $exception)';

  @override
  List<Object?> get props => [
        data,
        exception,
      ];
}
