// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_single_nullable_legacy_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: legacy
/// nullable: true
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
  @factory
  static ResultSuccess /*!*/ success({@required D /*?*/ data}) =>
      ResultSuccess(data: data);

  @factory
  static ResultError /*!*/ error({
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

  @factory
  ResultSuccess /*!*/ copy({D /*?*/ data}) =>
      ResultSuccess(data: data ?? this.data);

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [data];
}

class ResultError extends Result {
  ResultError({
    @required this.exception,
    @required this.code,
  });

  final dynamic /*!*/ exception;
  final int /*?*/ code;

  @factory
  ResultError /*!*/ copy({
    dynamic /*?*/ exception,
    int /*?*/ code,
  }) =>
      ResultError(
        exception: exception ?? this.exception,
        code: code ?? this.code,
      );

  @override
  String /*!*/ toString() => 'Result.error(exception: $exception, code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        exception,
        code,
      ];
}
