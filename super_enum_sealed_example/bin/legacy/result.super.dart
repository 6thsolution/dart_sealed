// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result.dart';

// **************************************************************************
// Generator: super_enum_sealed_generators
// **************************************************************************

// ignore_for_file: unused_element, unused_field

// Migration guide for Result:
// For migration to dart_sealed, uncomment
// following generated manifest code, then
// replace it with your super_enum manifest
// then add dependencies to sealed_annotations
// and sealed_generators, then import
// sealed_annotations instead of
// super_enum_sealed_annotations, then change
// part file name from *.super.dart to
// *.sealed.dart, then rerun the build_runner.
// When you are done with migrating all sealed
// classes to dart_sealed, you can remove
// super_enum_sealed_annotations and
// super_enum_sealed_generators dependencies.
//
// @Sealed()
// abstract class _Result<Generic extends Object/*?*/>
// {
// @WithEquality(Equality.data)
// @WithName('Success')
// void success(Generic/*!*/ data);
//
// @WithEquality(Equality.data)
// @WithName('Error')
// void error(Object/*!*/ exception);
// }

/// [Result]<[Generic] extends [Object]?> {
///
/// ([Success] success){[Generic] data} with data equality
///
/// ([Error] error){[Object] exception} with data equality
///
/// }
@immutable
abstract class Result<Generic extends Object /*?*/ > {
  const Result._internal();

  @factory
  static Success<Generic> /*!*/ success<Generic extends Object /*?*/ >({
    @required Generic /*!*/ data,
  }) =>
      Success<Generic>(
        data: data,
      );

  @factory
  static Error<Generic> /*!*/ error<Generic extends Object /*?*/ >({
    @required Object /*!*/ exception,
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

  void whenPartial({
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
}

/// (([Success] : [Result])<[Generic] extends [Object]?> success){[Generic] data}
///
/// with data equality
@immutable
class Success<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  const Success({
    @required this.data,
  }) : super._internal();

  final Generic /*!*/ data;

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}

/// (([Error] : [Result])<[Generic] extends [Object]?> error){[Object] exception}
///
/// with data equality
@immutable
class Error<Generic extends Object /*?*/ > extends Result<Generic>
    with EquatableMixin {
  const Error({
    @required this.exception,
  }) : super._internal();

  final Object /*!*/ exception;

  @override
  String /*!*/ toString() => 'Result.error(exception: $exception)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
      ];
}
