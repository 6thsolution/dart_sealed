// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_hierarchy.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [num]> {
///
/// ([ResultSuccess] success){[D] data} with data equality
///
/// ([ResultError] error){[Object] exception} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<D extends num> {
  const Result._internal();

  const factory Result.success({
    required D data,
  }) = ResultSuccess<D>;

  const factory Result.error({
    required Object exception,
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
    required R Function(D data) success,
    required R Function(Object exception) error,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success(result.data);
    } else if (result is ResultError<D>) {
      return error(result.exception);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(D data)? success,
    R Function(Object exception)? error,
    required R Function(Result<D> result) orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result.data) : orElse(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result.exception) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(D data)? success,
    void Function(Object exception)? error,
    void Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      if (success != null) {
        success(result.data);
      } else if (orElse != null) {
        orElse(result);
      }
    } else if (result is ResultError<D>) {
      if (error != null) {
        error(result.exception);
      } else if (orElse != null) {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(D data)? success,
    R Function(Object exception)? error,
    R Function(Result<D> result)? orElse,
  }) {
    final result = this;
    if (result is ResultSuccess<D>) {
      return success != null ? success(result.data) : orElse?.call(result);
    } else if (result is ResultError<D>) {
      return error != null ? error(result.exception) : orElse?.call(result);
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

/// (([ResultSuccess] : [Result])<[D] extends [num]> success){[D] data}
///
/// with data equality
class ResultSuccess<D extends num> extends Result<D> with EquatableMixin {
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

/// (([ResultError] : [Result])<[D] extends [num]> error){[Object] exception}
///
/// with data equality
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

/// [Basket] {
///
/// ([BasketHold] hold){[Result<int>] x, [Result<double>]? y} with data equality
///
/// }
@SealedManifest(_Basket)
abstract class Basket {
  const Basket._internal();

  const factory Basket.hold({
    required Result<int> x,
    Result<double>? y,
  }) = BasketHold;

  bool get isHold => this is BasketHold;

  BasketHold get asHold => this as BasketHold;

  BasketHold? get asHoldOrNull {
    final basket = this;
    return basket is BasketHold ? basket : null;
  }

  R when<R extends Object?>({
    required R Function(Result<int> x, Result<double>? y) hold,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold(basket.x, basket.y);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Result<int> x, Result<double>? y)? hold,
    required R Function(Basket basket) orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold != null ? hold(basket.x, basket.y) : orElse(basket);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Result<int> x, Result<double>? y)? hold,
    void Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      if (hold != null) {
        hold(basket.x, basket.y);
      } else if (orElse != null) {
        orElse(basket);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Result<int> x, Result<double>? y)? hold,
    R Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold != null ? hold(basket.x, basket.y) : orElse?.call(basket);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(BasketHold hold) hold,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold(basket);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(BasketHold hold)? hold,
    required R Function(Basket basket) orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold != null ? hold(basket) : orElse(basket);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(BasketHold hold)? hold,
    void Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      if (hold != null) {
        hold(basket);
      } else if (orElse != null) {
        orElse(basket);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(BasketHold hold)? hold,
    R Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketHold) {
      return hold != null ? hold(basket) : orElse?.call(basket);
    } else {
      throw AssertionError();
    }
  }
}

/// (([BasketHold] : [Basket]) hold){[Result<int>] x, [Result<double>]? y}
///
/// with data equality
class BasketHold extends Basket with EquatableMixin {
  const BasketHold({
    required this.x,
    this.y,
  }) : super._internal();

  final Result<int> x;
  final Result<double>? y;

  @override
  String toString() => 'Basket.hold(x: $x, y: $y)';

  @override
  List<Object?> get props => [
        x,
        y,
      ];
}
