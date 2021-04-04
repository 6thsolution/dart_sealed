// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_no_upper_nullsafe_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: null-safe
/// nullable: false
class D extends Object {}

/// nullable: false
class E extends Object {}
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: null-safe
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Result$<D extends Object, E extends Object> {
  void success(D data);

  void error(E? exception);
}
// **************************************************************************

@SealedManifest(_Result)
abstract class Result extends Equatable {
  @factory
  static ResultSuccess success({required D data}) => ResultSuccess(data: data);

  @factory
  static ResultError error({required E? exception}) =>
      ResultError(exception: exception);

  bool isSuccess() => this is ResultSuccess;

  bool isError() => this is ResultError;

  ResultSuccess asSuccess() => this as ResultSuccess;

  ResultError asError() => this as ResultError;

  ResultSuccess? asSuccessOrNull() =>
      this is ResultSuccess ? this as ResultSuccess : null;

  ResultError? asErrorOrNull() =>
      this is ResultError ? this as ResultError : null;
}

class ResultSuccess extends Result {
  ResultSuccess({required this.data});

  final D data;

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [data];
}

class ResultError extends Result {
  ResultError({required this.exception});

  final E? exception;

  @override
  String toString() => 'Result.error(exception: $exception)';

  @override
  List<Object?> get props => [exception];
}
