// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single_empty.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

class D extends Object {}

/// Result<D extends Object?> {
///
/// Success(D? data)
///
/// Empty()
///
/// Error(int? code)
///
/// }
///
/// with data equality.
@SealedManifest(_Result)
abstract class Result {
  @factory
  static ResultSuccess /*!*/ success({@required D /*?*/ data}) =>
      ResultSuccess(data: data);

  @factory
  static ResultEmpty /*!*/ empty() => ResultEmpty();

  @factory
  static ResultError /*!*/ error({@required int /*?*/ code}) =>
      ResultError(code: code);

  bool isSuccess() => this is ResultSuccess /*!*/;

  bool isEmpty() => this is ResultEmpty /*!*/;

  bool isError() => this is ResultError /*!*/;

  ResultSuccess /*!*/ asSuccess() => this as ResultSuccess /*!*/;

  ResultEmpty /*!*/ asEmpty() => this as ResultEmpty /*!*/;

  ResultError /*!*/ asError() => this as ResultError /*!*/;

  ResultSuccess /*?*/ asSuccessOrNull() {
    final result = this;
    return result is ResultSuccess /*!*/ ? result : null;
  }

  ResultEmpty /*?*/ asEmptyOrNull() {
    final result = this;
    return result is ResultEmpty /*!*/ ? result : null;
  }

  ResultError /*?*/ asErrorOrNull() {
    final result = this;
    return result is ResultError /*!*/ ? result : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(ResultSuccess /*!*/ success) /*!*/ success,
    @required R Function(ResultEmpty /*!*/ empty) /*!*/ empty,
    @required R Function(ResultError /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success(result);
    } else if (result is ResultEmpty /*!*/) {
      return empty(result);
    } else if (result is ResultError /*!*/) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    R Function(ResultError /*!*/ error) /*?*/ error,
    @required R Function(Result /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return (success ?? orElse)(result);
    } else if (result is ResultEmpty /*!*/) {
      return (empty ?? orElse)(result);
    } else if (result is ResultError /*!*/) {
      return (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    R Function(ResultError /*!*/ error) /*?*/ error,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success != null ? success(result) : orDefault;
    } else if (result is ResultEmpty /*!*/) {
      return empty != null ? empty(result) : orDefault;
    } else if (result is ResultError /*!*/) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }
}

class ResultSuccess extends Result with EquatableMixin {
  ResultSuccess({@required this.data});

  final D /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [data];
}

class ResultEmpty extends Result with EquatableMixin {
  ResultEmpty();

  @override
  String /*!*/ toString() => 'Result.empty()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

class ResultError extends Result with EquatableMixin {
  ResultError({@required this.code});

  final int /*?*/ code;

  @override
  String /*!*/ toString() => 'Result.error(code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [code];
}
