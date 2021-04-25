// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result.dart';

// **************************************************************************
// Generator: sealed_super_enum_mapper
// **************************************************************************

// ignore_for_file: unused_element, unused_field

/// substitute generated manifest for super enum
/// and remove "$" at the end of class name.
@Sealed()
abstract class _Result$<Generic extends Object /*?*/ > {
  @Meta(name: 'Success', equality: Equality.data)
  void success(Generic /*?*/ data);

  @Meta(name: 'Error', equality: Equality.data)
  void error(Object /*?*/ exception);
}

/// [Result]<[Generic] extends [Object]?> {
///
/// ([Success] success){[Generic]? data} with data equality
///
/// ([Error] error){[Object]? exception} with data equality
///
/// }
@SealedManifest(_Result)
abstract class Result<Generic extends Object /*?*/ > {
  @factory
  static Success<Generic> /*!*/ success<Generic extends Object /*?*/ >({
    @required Generic /*?*/ data,
  }) =>
      Success<Generic>(
        data: data,
      );

  @factory
  static Error<Generic> /*!*/ error<Generic extends Object /*?*/ >({
    @required Object /*?*/ exception,
  }) =>
      Error<Generic>(
        exception: exception,
      );

  bool /*!*/ isSuccess() => this is Success<Generic>;

  bool /*!*/ isError() => this is Error<Generic>;

  Success<Generic> /*!*/ asSuccess() => this as Success<Generic>;

  Error<Generic> /*!*/ asError() => this as Error<Generic>;

  Success<Generic> /*?*/ asSuccessOrNull() {
    final result = this;
    return result is Success<Generic> ? result : null;
  }

  Error<Generic> /*?*/ asErrorOrNull() {
    final result = this;
    return result is Error<Generic> ? result : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(Success<Generic> /*!*/ success) /*!*/ success,
    @required R Function(Error<Generic> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is Success<Generic>) {
      return success(result);
    } else if (result is Error<Generic>) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(Success<Generic> /*!*/ success) /*?*/ success,
    R Function(Error<Generic> /*!*/ error) /*?*/ error,
    @required R Function(Result<Generic> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is Success<Generic>) {
      return success != null ? success(result) : orElse(result);
    } else if (result is Error<Generic>) {
      return error != null ? error(result) : orElse(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(Success<Generic> /*!*/ success) /*?*/ success,
    R Function(Error<Generic> /*!*/ error) /*?*/ error,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final result = this;
    if (result is Success<Generic>) {
      return success != null ? success(result) : orDefault;
    } else if (result is Error<Generic>) {
      return error != null ? error(result) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(Success<Generic> /*!*/ success) /*?*/ success,
    R Function(Error<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is Success<Generic>) {
      return success?.call(result);
    } else if (result is Error<Generic>) {
      return error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(Success<Generic> /*!*/ success) /*?*/ success,
    R Function(Error<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is Success<Generic> && success != null) {
      return success(result);
    } else if (result is Error<Generic> && error != null) {
      return error(result);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(Success<Generic> /*!*/ success) /*!*/ success,
    @required void Function(Error<Generic> /*!*/ error) /*!*/ error,
  }) {
    assert(success != null);
    assert(error != null);
    final result = this;
    if (result is Success<Generic>) {
      success(result);
    } else if (result is Error<Generic>) {
      error(result);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(Success<Generic> /*!*/ success) /*?*/ success,
    void Function(Error<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is Success<Generic>) {
      success?.call(result);
    } else if (result is Error<Generic>) {
      error?.call(result);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(Success<Generic> /*!*/ success) /*?*/ success,
    void Function(Error<Generic> /*!*/ error) /*?*/ error,
    @required void Function(Result<Generic> /*!*/ result) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final result = this;
    if (result is Success<Generic>) {
      if (success != null) {
        success(result);
      } else {
        orElse(result);
      }
    } else if (result is Error<Generic>) {
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
    void Function(Success<Generic> /*!*/ success) /*?*/ success,
    void Function(Error<Generic> /*!*/ error) /*?*/ error,
  }) {
    final result = this;
    if (result is Success<Generic> && success != null) {
      success(result);
    } else if (result is Error<Generic> && error != null) {
      error(result);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Success] : [Result])<[Generic] extends [Object]?> success){[Generic]? data}
///
/// with data equality
class Success<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  Success({
    @required this.data,
  });

  final Generic /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}

/// (([Error] : [Result])<[Generic] extends [Object]?> error){[Object]? exception}
///
/// with data equality
class Error<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  Error({
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
