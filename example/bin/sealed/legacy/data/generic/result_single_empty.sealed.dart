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
  static ResultSuccess /*!*/ success({
    @required D /*?*/ data,
  }) =>
      ResultSuccess(
        data: data,
      );

  @factory
  static ResultEmpty /*!*/ empty() => ResultEmpty();

  @factory
  static ResultError /*!*/ error({
    @required int /*?*/ code,
  }) =>
      ResultError(
        code: code,
      );

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

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    R Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess /*!*/) {
      return success?.call(result);
    } else if (result is ResultEmpty /*!*/) {
      return empty?.call(result);
    } else if (result is ResultError /*!*/) {
      return error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(ResultSuccess /*!*/ success) /*?*/ success,
    R Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    R Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess /*!*/ && success != null) {
      return success(result);
    } else if (result is ResultEmpty /*!*/ && empty != null) {
      return empty(result);
    } else if (result is ResultError /*!*/ && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(ResultSuccess /*!*/ success) /*!*/ success,
    @required void Function(ResultEmpty /*!*/ empty) /*!*/ empty,
    @required void Function(ResultError /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      success(result);
    } else if (result is ResultEmpty /*!*/) {
      empty(result);
    } else if (result is ResultError /*!*/) {
      error(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(ResultSuccess /*!*/ success) /*?*/ success,
    void Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    void Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      success?.call(result);
    } else if (result is ResultEmpty /*!*/) {
      empty?.call(result);
    } else if (result is ResultError /*!*/) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(ResultSuccess /*!*/ success) /*?*/ success,
    void Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    void Function(ResultError /*!*/ error) /*?*/ error,
    @required void Function(Result /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is ResultSuccess /*!*/) {
      (success ?? orElse)(result);
    } else if (result is ResultEmpty /*!*/) {
      (empty ?? orElse)(result);
    } else if (result is ResultError /*!*/) {
      (error ?? orElse)(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(ResultSuccess /*!*/ success) /*?*/ success,
    void Function(ResultEmpty /*!*/ empty) /*?*/ empty,
    void Function(ResultError /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is ResultSuccess /*!*/ && success != null) {
      success(result);
    } else if (result is ResultEmpty /*!*/ && empty != null) {
      empty(result);
    } else if (result is ResultError /*!*/ && error != null) {
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

class ResultEmpty extends Result with EquatableMixin {
  ResultEmpty();

  @override
  String /*!*/ toString() => 'Result.empty()';

  @override
  List<Object /*?*/ > /*!*/ get props => [];
}

class ResultError extends Result with EquatableMixin {
  ResultError({
    @required this.code,
  });

  final int /*?*/ code;

  @override
  String /*!*/ toString() => 'Result.error(code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        code,
      ];
}
