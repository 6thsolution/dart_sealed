// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_legacy.dart';

// **************************************************************************
// Generator: sealed_super_enum_mapper
// **************************************************************************

// ignore_for_file: unused_element, unused_field

/// substitute generated manifest for super enum
/// and remove "$" at the end of class name.
@Sealed(equality: Equality.data)
abstract class _Result$<Generic extends Object /*?*/ > {
  void success(Generic /*?*/ data);
  void error(Object /*?*/ exception);
}

/// Result<Generic extends Object?> {
///
/// Success(Generic? data)
///
/// Error(Object? exception)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result<Generic extends Object /*?*/ > {
  @factory
  static ResultSuccess<Generic> /*!*/ success<Generic extends Object /*?*/ >({
    @required Generic /*?*/ data,
  }) =>
      ResultSuccess<Generic>(
        data: data,
      );

  @factory
  static ResultError<Generic> /*!*/ error<Generic extends Object /*?*/ >({
    @required Object /*?*/ exception,
  }) =>
      ResultError<Generic>(
        exception: exception,
      );

  bool isSuccess() => this is ResultSuccess<Generic> /*!*/;

  bool isError() => this is ResultError<Generic> /*!*/;

  ResultSuccess<Generic> /*!*/ asSuccess() =>
      this as ResultSuccess<Generic> /*!*/;

  ResultError<Generic> /*!*/ asError() => this as ResultError<Generic> /*!*/;

  ResultSuccess<Generic> /*?*/ asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess<Generic> /*!*/ ? result : null;
  }

  ResultError<Generic> /*?*/ asErrorOrNull() {
    final result = this;
    return result is ResultError<Generic> /*!*/ ? result : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(ResultSuccess<Generic> /*!*/ success) /*!*/ success,
    @required R Function(ResultError<Generic> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      return success(result);
    } else if (result is ResultError<Generic> /*!*/) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    R Function(ResultError<Generic> /*!*/ error) /*?*/ error,
    @required R Function(Result<Generic> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      return (success ?? orElse)(result);
    } else if (result is ResultError<Generic> /*!*/) {
      return (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    R Function(ResultError<Generic> /*!*/ error) /*?*/ error,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultError<Generic> /*!*/) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    R Function(ResultError<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      return success?.call(result);
    } else if (result is ResultError<Generic> /*!*/) {
      return error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    R Function(ResultError<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/ && success != null) {
      return success(result);
    } else if (result is ResultError<Generic> /*!*/ && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(ResultSuccess<Generic> /*!*/ success) /*!*/ success,
    @required void Function(ResultError<Generic> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      success(result);
    } else if (result is ResultError<Generic> /*!*/) {
      error(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    void Function(ResultError<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      success?.call(result);
    } else if (result is ResultError<Generic> /*!*/) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    void Function(ResultError<Generic> /*!*/ error) /*?*/ error,
    @required void Function(Result<Generic> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/) {
      (success ?? orElse)(result);
    } else if (result is ResultError<Generic> /*!*/) {
      (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess<Generic> /*!*/ success) /*?*/ success,
    void Function(ResultError<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess<Generic> /*!*/ && success != null) {
      success(result);
    } else if (result is ResultError<Generic> /*!*/ && error != null) {
      error(result);
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  ResultSuccess({
    @required this.data,
  });

  final Generic /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.Success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}

class ResultError<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  ResultError({
    @required this.exception,
  });

  final Object /*?*/ exception;

  @override
  String /*!*/ toString() => 'Result.Error(exception: $exception)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
      ];
}
