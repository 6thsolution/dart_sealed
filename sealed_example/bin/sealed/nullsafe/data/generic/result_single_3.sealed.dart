// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_single_3.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [num]> {
///
/// ([ResultSuccess] success){[D]? data} with data equality
///
/// ([ResultError] error){[Object] exception} with data equality
///
/// }
@immutable
@SealedManifest(_Result)
abstract class Result<D extends num> {
  const Result._internal();

  const factory Result.success({
    required D? data,
  }) = ResultSuccess<D>;

  const factory Result.error({
    required Object exception,
  }) = ResultError<D>;

  bool isSuccess() => this is ResultSuccess<D>;

  bool isError() => this is ResultError<D>;

  ResultSuccess<D> asSuccess() => this as ResultSuccess<D>;

  ResultError<D> asError() => this as ResultError<D>;

  ResultSuccess<D>? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D> ? result : null;
  }

  ResultError<D>? asErrorOrNull() {
    final result = this;
    return result is ResultError<D> ? result : null;
  }

  R when<R extends Object?>({
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

  R whenOrElse<R extends Object?>({
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

  void whenPartial({
    void Function(ResultSuccess<D> success)? success,
    void Function(ResultError<D> error)? error,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      success?.call(result);
    } else if (result is ResultError<D>) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultSuccess] : [Result])<[D] extends [num]> success){[D]? data}
///
/// with data equality
@immutable
class ResultSuccess<D extends num> extends Result<D> with EquatableMixin {
  const ResultSuccess({
    required this.data,
  }) : super._internal();

  final D? data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

/// (([ResultError] : [Result])<[D] extends [num]> error){[Object] exception}
///
/// with data equality
@immutable
class ResultError<D extends num> extends Result<D> with EquatableMixin {
  const ResultError({
    required this.exception,
  }) : super._internal();

  final Object exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [
        exception,
      ];
}
