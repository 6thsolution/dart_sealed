// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single_nullable.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

class D extends Object {}

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
abstract class Result {
  @factory
  static ResultSuccess /*!*/ success({
    @required D /*?*/ data,
  }) =>
      ResultSuccess(
        data: data,
      );

  @factory
  static ResultError /*!*/ error({
    @required dynamic /*?*/ exception,
    @required int /*?*/ code,
  }) =>
      ResultError(
        exception: exception,
        code: code,
      );

  bool isSuccess() => this is ResultSuccess /*!*/;

  bool isError() => this is ResultError /*!*/;

  ResultSuccess /*!*/ asSuccess() => this as ResultSuccess /*!*/;

  ResultError /*!*/ asError() => this as ResultError /*!*/;

  ResultSuccess /*?*/ asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess /*!*/ ? result : null;
  }

  ResultError /*?*/ asErrorOrNull() {
    final result = this;
    return result is ResultError /*!*/ ? result : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(ResultSuccess /*!*/ success) /*!*/ success,
    @required R Function(ResultError /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success(result);
    } else if (result is ResultError /*!*/) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultError /*!*/ error) /*?*/ error,
    @required R Function(Result /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return (success ?? orElse)(result);
    } else if (result is ResultError /*!*/) {
      return (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultError /*!*/ error) /*?*/ error,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError /*!*/) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success != null ? success(result) : null;
    } else if (result is ResultError /*!*/) {
      return error != null ? error(result) : null;
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess /*!*/ && success != null) {
      return success(result);
    } else if (result is ResultError /*!*/ && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(ResultSuccess /*!*/ success) /*!*/ success,
    @required void Function(ResultError /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      success(result);
    } else if (result is ResultError /*!*/) {
      error(result);
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess extends Result with EquatableMixin {
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

class ResultError extends Result with EquatableMixin {
  ResultError({
    @required this.exception,
    @required this.code,
  });

  final dynamic /*?*/ exception;
  final int /*?*/ code;

  @override
  String /*!*/ toString() => 'Result.error(exception: $exception, code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
        code,
      ];
}
