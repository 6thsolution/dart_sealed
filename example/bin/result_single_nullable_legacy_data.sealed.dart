// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single_nullable_legacy_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: legacy
class D extends Object {}
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Result$<D extends Object /*?*/ > {
  void success(D /*?*/ data);

  void error(
    dynamic exception,
    int /*?*/ code,
  );
}
// **************************************************************************

@SealedManifest(_Result)
abstract class Result extends Equatable {
  ResultSuccess /*!*/ success({@required D /*?*/ data}) =>
      ResultSuccess(data: data);

  ResultError /*!*/ error({
    @required dynamic /*!*/ exception,
    @required int /*?*/ code,
  }) =>
      ResultError(
        exception: exception,
        code: code,
      );

  bool isSuccess() => this is ResultSuccess;

  bool isError() => this is ResultError;

  ResultSuccess /*!*/ asSuccess() => this as ResultSuccess;

  ResultError /*!*/ asError() => this as ResultError;

  ResultSuccess /*?*/ asSuccessOrNull() =>
      this is ResultSuccess ? this as ResultSuccess : null;

  ResultError /*?*/ asErrorOrNull() =>
      this is ResultError ? this as ResultError : null;
}

class ResultSuccess extends Result {
  ResultSuccess({@required this.data});

  final D /*?*/ data;

  @override
  List<Object /*?*/ > get props => [];
}

class ResultError extends Result {
  ResultError({
    @required this.exception,
    @required this.code,
  });

  final dynamic /*!*/ exception;
  final int /*?*/ code;

  @override
  List<Object /*?*/ > get props => [];
}
