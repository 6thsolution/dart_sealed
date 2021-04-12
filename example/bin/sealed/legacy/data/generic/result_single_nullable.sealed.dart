// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single_nullable.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Result<D extends Object?> {
///
/// Success(D? data)
///
/// Error(dynamic? exception, int? code)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result<D extends Object /*?*/ > {
  @factory
  static ResultSuccess<D> /*!*/ success<D extends Object /*?*/ >({
    @required D /*?*/ data,
  }) =>
      ResultSuccess<D>(
        data: data,
      );

  @factory
  static ResultError<D> /*!*/ error<D extends Object /*?*/ >({
    @required dynamic /*?*/ exception,
    @required int /*?*/ code,
  }) =>
      ResultError<D>(
        exception: exception,
        code: code,
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
      return (success ?? orElse)(result);
    } else if (result is ResultError<D> /*!*/) {
      return (error ?? orElse)(result);
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
      (success ?? orElse)(result);
    } else if (result is ResultError<D> /*!*/) {
      (error ?? orElse)(result);
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

class ResultSuccess<D extends Object /*?*/ > extends Result<D>
    with EquatableMixin {
  ResultSuccess({
    @required this.data,
  });

  final D /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.Success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}

class ResultError<D extends Object /*?*/ > extends Result<D>
    with EquatableMixin {
  ResultError({
    @required this.exception,
    @required this.code,
  });

  final dynamic /*?*/ exception;
  final int /*?*/ code;

  @override
  String /*!*/ toString() => 'Result.Error(exception: $exception, code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
        code,
      ];
}
