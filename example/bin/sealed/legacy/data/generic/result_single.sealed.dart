// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Result]<[D] extends [num?]> {
///
/// ([ResultSuccess] success){[D?] data} with data equality
///
/// ([ResultError] error){[Object?] exception} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<D extends num /*?*/ > {
  @factory
  static ResultSuccess<D> /*!*/ success<D extends num /*?*/ >({
    @required D /*?*/ data,
  }) =>
      ResultSuccess<D>(
        data: data,
      );

  @factory
  static ResultError<D> /*!*/ error<D extends num /*?*/ >({
    @required Object /*?*/ exception,
  }) =>
      ResultError<D>(
        exception: exception,
      );

  bool isSuccess() => this is ResultSuccess<D> /*!*/;

  bool isError() => this is ResultError<D> /*!*/;

  ResultSuccess<D> /*!*/ asSuccess() => this as ResultSuccess<D> /*!*/;

  ResultError<D> /*!*/ asError() => this as ResultError<D> /*!*/;

  ResultSuccess<D> /*?*/ asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<D> /*!*/ ? result : null;
  }

  ResultError<D> /*?*/ asErrorOrNull() {
    final result = this;
    return result is ResultError<D> /*!*/ ? result : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(ResultSuccess<D> /*!*/ success) /*!*/ success,
    @required R Function(ResultError<D> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      return success(result);
    } else if (result is ResultError<D> /*!*/) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    R Function(ResultError<D> /*!*/ error) /*?*/ error,
    @required R Function(Result<D> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      return success != null ? success(result) : orElse(result);
    } else if (result is ResultError<D> /*!*/) {
      return error != null ? error(result) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    R Function(ResultError<D> /*!*/ error) /*?*/ error,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError<D> /*!*/) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    R Function(ResultError<D> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      return success?.call(result);
    } else if (result is ResultError<D> /*!*/) {
      return error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    R Function(ResultError<D> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<D> /*!*/ && success != null) {
      return success(result);
    } else if (result is ResultError<D> /*!*/ && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(ResultSuccess<D> /*!*/ success) /*!*/ success,
    @required void Function(ResultError<D> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      success(result);
    } else if (result is ResultError<D> /*!*/) {
      error(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    void Function(ResultError<D> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      success?.call(result);
    } else if (result is ResultError<D> /*!*/) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    void Function(ResultError<D> /*!*/ error) /*?*/ error,
    @required void Function(Result<D> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess<D> /*!*/) {
      if (success != null) {
        success(result);
      } else {
        orElse(result);
      }
    } else if (result is ResultError<D> /*!*/) {
      if (error != null) {
        error(result);
      } else {
        orElse(result);
      }
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess<D> /*!*/ success) /*?*/ success,
    void Function(ResultError<D> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<D> /*!*/ && success != null) {
      success(result);
    } else if (result is ResultError<D> /*!*/ && error != null) {
      error(result);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultSuccess] : [Result])<[D] extends [num?]> success){[D?] data}
///
/// with data equality
class ResultSuccess<D extends num /*?*/ > extends Result<D>
    with EquatableMixin {
  ResultSuccess({
    @required this.data,
  });

  final D /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}

/// (([ResultError] : [Result])<[D] extends [num?]> error){[Object?] exception}
///
/// with data equality
class ResultError<D extends num /*?*/ > extends Result<D> with EquatableMixin {
  ResultError({
    @required this.exception,
  });

  final Object /*?*/ exception;

  @override
  String /*!*/ toString() => 'Result.error(exception: $exception)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
      ];
}
