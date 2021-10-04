// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_common.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [num]> {
///
/// {[Object]? value}
///
/// ([ResultSuccess] success){[D] value} with data equality
///
/// ([ResultError] error){[Object]? value} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<D extends num> {
  const Result._internal();

  Object? get value;

  const factory Result.success({
    required D value,
  }) = ResultSuccess<D>;

  const factory Result.error({
    Object? value,
  }) = ResultError<D>;

  bool get isSuccess => this is ResultSuccess<D>;

  bool get isError => this is ResultError<D>;

  ResultSuccess<D> get asSuccess => this as ResultSuccess<D>;

  ResultError<D> get asError => this as ResultError<D>;

  ResultSuccess<D>? get asSuccessOrNull {
    final result = this;
    return result is ResultSuccess<D> ? result : null;
  }

  ResultError<D>? get asErrorOrNull {
    final result = this;
    return result is ResultError<D> ? result : null;
  }

  R when<R extends Object?>({
    required R Function(D value) success,
    required R Function(Object? value) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success(result.value);
    } else if (result is ResultError<D>) {
      return error(result.value);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(D value)? success,
    R Function(Object? value)? error,
    required R Function(Result<D> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result.value) : orElse(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result.value) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(D value)? success,
    void Function(Object? value)? error,
    void Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      if (success != null) {
        success(result.value);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultError<D>) {
      if (error != null) {
        error(result.value);
      } else if (orElse != null) {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(D value)? success,
    R Function(Object? value)? error,
    R Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result.value) : orElse?.call(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result.value) : orElse?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ResultSuccess<D> success) success,
    required R Function(ResultError<D> error) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success(result);
    } else if (result is ResultError<D>) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ResultSuccess<D> success)? success,
    R Function(ResultError<D> error)? error,
    required R Function(Result<D> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result) : orElse(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ResultSuccess<D> success)? success,
    void Function(ResultError<D> error)? error,
    void Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      if (success != null) {
        success(result);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultError<D>) {
      if (error != null) {
        error(result);
      } else if (orElse != null) {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ResultSuccess<D> success)? success,
    R Function(ResultError<D> error)? error,
    R Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result) : orElse?.call(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result) : orElse?.call(result);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultSuccess] : [Result])<[D] extends [num]> success){[D] value}
///
/// with data equality
class ResultSuccess<D extends num> extends Result<D> with EquatableMixin {
  const ResultSuccess({
    required this.value,
  }) : super._internal();

  @override
  final D value;

  @override
  String toString() => 'Result.success(value: $value)';

  @override
  List<Object?> get props => [
        value,
      ];
}

/// (([ResultError] : [Result])<[D] extends [num]> error){[Object]? value}
///
/// with data equality
class ResultError<D extends num> extends Result<D> with EquatableMixin {
  const ResultError({
    this.value,
  }) : super._internal();

  @override
  final Object? value;

  @override
  String toString() => 'Result.error(value: $value)';

  @override
  List<Object?> get props => [
        value,
      ];
}
