// @dart=2.12
import 'package:sealed_annotations/sealed_annotations.dart';

void main() {
  final x1 = Result.error(exception: Base());
  final x2 = Result.error(exception: BaseSub());
  final x3 = Result.success(data: 123);
  final x4 = Result.success(data: null); // no need !
  final x5 = Result.success<int>(data: null);
  final x6 = Result.success<double>(data: null);
  final x7 = Result.success(data: Object());
  final x8 = Result.success(data: 'abc');

  final xs = <Result<Object?, Base>>[x1, x2, x3, x4, x5, x6, x7, x8];
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

abstract class Result<D extends Object?, E extends Base> {
  @factory
  static ResultSuccess<D> success<D extends Object?>({
    required D? data,
  }) =>
      ResultSuccess<D>(
        data: data,
      );

  @factory
  static ResultError<E> error<E extends Base>({
    required E exception,
  }) =>
      ResultError<E>(
        exception: exception,
      );

  bool isSuccess() => this is ResultSuccess<D>;

  bool isError() => this is ResultError<E>;

  ResultSuccess<D> asSuccess() => this as ResultSuccess<D>;

  ResultError<E> asError() => this as ResultError<E>;

  ResultSuccess<D>? asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D> ? result as ResultSuccess<D> : null;
  }

  ResultError<E>? asErrorOrNull() {
    final result = this;
    return result is ResultError<E> ? result as ResultError<E> : null;
  }

  R when<R extends Object?>({
    required R Function(ResultSuccess<D> success) success,
    required R Function(ResultError<E> error) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success(result as ResultSuccess<D>);
    } else if (result is ResultError<E>) {
      return error(result as ResultError<E>);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(ResultSuccess<D> success)? success,
    R Function(ResultError<E> error)? error,
    required R Function(Result<D, E> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      if (success != null) {
        return success(result as ResultSuccess<D>);
      } else {
        return orElse(result);
      }
    } else if (result is ResultError<E>) {
      if (error != null) {
        return error(result as ResultError<E>);
      } else {
        return orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess<D extends Object?> extends Result<D, Base> {
  ResultSuccess({required this.data});

  final D? data;

  @override
  String toString() => '$runtimeType(data: $data)';
}

class ResultError<E extends Base> extends Result<Object?, E> {
  ResultError({
    required this.exception,
  });

  final E exception;

  @override
  String toString() => '$runtimeType(exception: $exception)';
}
