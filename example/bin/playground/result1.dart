// @dart=2.12
import 'package:sealed_annotations/sealed_annotations.dart';

void main() {
  final x1 = Result.error(exception: Base());
  final x2 = Result.error(exception: BaseSub());
  final x3 = Result.success(data: 123);
  // note here:
  final x4 = Result.success<Object, Base>(data: null);
  // note here:
  final x5 = Result.success<int, Base>(data: null);
  // note here:
  final x6 = Result.success<int, BaseSub>(data: null);
  final x7 = Result.success(data: Object());
  final x8 = Result.success(data: 'abc');

  final xs = <Result<Object, Base>>[x1, x2, x3, x4, x5, x6, x7, x8];
  for (var i = 0; i < xs.length; i++) {
    final x = xs[i];
    print('x$i = $x');
    final y = x.when(
      success: (success) => 'success<${success.runtimeType}>: ${success.data}',
      error: (error) => 'error<${error.runtimeType}>: ${error.exception}',
    );
    print('      $y');
  }
}

class Base {}

class BaseSub extends Base {}

abstract class Result<D extends Object, E extends Base> {
  @factory
  static ResultSuccess<D, E> success<D extends Object, E extends Base>({
    required D? data,
  }) =>
      ResultSuccess<D, E>(
        data: data,
      );

  @factory
  static ResultError<D, E> error<D extends Object, E extends Base>({
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
}

class ResultSuccess<D extends Object, E extends Base> extends Result<D, E> {
  ResultSuccess({required this.data});

  final D? data;

  @override
  String toString() => '$runtimeType(data: $data)';
}

class ResultError<D extends Object, E extends Base> extends Result<D, E> {
  ResultError({
    required this.exception,
  });

  final E exception;

  @override
  String toString() => '$runtimeType(exception: $exception)';
}
