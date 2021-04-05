// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_single_empty_nullsafe_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: null-safe
/// nullable: false
class D extends Object {}
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: null-safe
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Result$<D extends Object> {
  void success(D data);

  void empty();

  void error(int code);
}
// **************************************************************************

@SealedManifest(_Result)
abstract class Result extends Equatable {
  @factory
  static ResultSuccess success({required D data}) => ResultSuccess(data: data);

  @factory
  static ResultEmpty empty() => ResultEmpty();

  @factory
  static ResultError error({required int code}) => ResultError(code: code);

  bool isSuccess() => this is ResultSuccess;

  bool isEmpty() => this is ResultEmpty;

  bool isError() => this is ResultError;

  ResultSuccess asSuccess() => this as ResultSuccess;

  ResultEmpty asEmpty() => this as ResultEmpty;

  ResultError asError() => this as ResultError;

  ResultSuccess? asSuccessOrNull() =>
      this is ResultSuccess ? this as ResultSuccess : null;

  ResultEmpty? asEmptyOrNull() =>
      this is ResultEmpty ? this as ResultEmpty : null;

  ResultError? asErrorOrNull() =>
      this is ResultError ? this as ResultError : null;
}

class ResultSuccess extends Result {
  ResultSuccess({required this.data});

  final D data;

  @factory
  ResultSuccess copy({D? data}) => ResultSuccess(data: data ?? this.data);

  @override
  String toString() => 'Result.success(data: $data)';

  @override
  List<Object?> get props => [data];
}

class ResultEmpty extends Result {
  ResultEmpty();

  @factory
  ResultEmpty copy() => ResultEmpty();

  @override
  String toString() => 'Result.empty()';

  @override
  List<Object?> get props => [];
}

class ResultError extends Result {
  ResultError({required this.code});

  final int code;

  @factory
  ResultError copy({int? code}) => ResultError(code: code ?? this.code);

  @override
  String toString() => 'Result.error(code: $code)';

  @override
  List<Object?> get props => [code];
}
