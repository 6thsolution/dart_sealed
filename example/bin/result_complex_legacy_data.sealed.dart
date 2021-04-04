// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'result_complex_legacy_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: legacy
/// nullable: true
class D extends Object {}

/// nullable: true
class E extends Base {}
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Result$<D extends Object /*?*/, E extends Base /*?*/ > {
  void success(D /*?*/ data);

  void error(E /*?*/ exception);

  void dummy(D /*?*/ data);

  void partialSuccess(
    D /*?*/ data,
    E /*?*/ exception,
  );

  void partialError(
    E /*?*/ e,
    int /*?*/ code,
  );

  void doubleSuccess(
    D /*?*/ data1,
    D /*?*/ data2,
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
  static ResultError /*!*/ error({@required E /*?*/ exception}) =>
      ResultError(exception: exception);

  @factory
  static ResultDummy /*!*/ dummy({@required D /*?*/ data}) =>
      ResultDummy(data: data);

  @factory
  static ResultPartialSuccess /*!*/ partialSuccess({
    @required D /*?*/ data,
    @required E /*?*/ exception,
  }) =>
      ResultPartialSuccess(
        data: data,
        exception: exception,
      );

  @factory
  static ResultPartialError /*!*/ partialError({
    @required E /*?*/ e,
    @required int /*?*/ code,
  }) =>
      ResultPartialError(
        e: e,
        code: code,
      );

  @factory
  static ResultDoubleSuccess /*!*/ doubleSuccess({
    @required D /*?*/ data1,
    @required D /*?*/ data2,
    @required int /*?*/ code,
  }) =>
      ResultDoubleSuccess(
        data1: data1,
        data2: data2,
        code: code,
      );

  bool isSuccess() => this is ResultSuccess;

  bool isError() => this is ResultError;

  bool isDummy() => this is ResultDummy;

  bool isPartialSuccess() => this is ResultPartialSuccess;

  bool isPartialError() => this is ResultPartialError;

  bool isDoubleSuccess() => this is ResultDoubleSuccess;

  ResultSuccess /*!*/ asSuccess() => this as ResultSuccess;

  ResultError /*!*/ asError() => this as ResultError;

  ResultDummy /*!*/ asDummy() => this as ResultDummy;

  ResultPartialSuccess /*!*/ asPartialSuccess() => this as ResultPartialSuccess;

  ResultPartialError /*!*/ asPartialError() => this as ResultPartialError;

  ResultDoubleSuccess /*!*/ asDoubleSuccess() => this as ResultDoubleSuccess;

  ResultSuccess /*?*/ asSuccessOrNull() =>
      this is ResultSuccess ? this as ResultSuccess : null;

  ResultError /*?*/ asErrorOrNull() =>
      this is ResultError ? this as ResultError : null;

  ResultDummy /*?*/ asDummyOrNull() =>
      this is ResultDummy ? this as ResultDummy : null;

  ResultPartialSuccess /*?*/ asPartialSuccessOrNull() =>
      this is ResultPartialSuccess ? this as ResultPartialSuccess : null;

  ResultPartialError /*?*/ asPartialErrorOrNull() =>
      this is ResultPartialError ? this as ResultPartialError : null;

  ResultDoubleSuccess /*?*/ asDoubleSuccessOrNull() =>
      this is ResultDoubleSuccess ? this as ResultDoubleSuccess : null;
}

class ResultSuccess extends Result {
  ResultSuccess({@required this.data});

  final D /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.success(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [data];
}

class ResultError extends Result {
  ResultError({@required this.exception});

  final E /*?*/ exception;

  @override
  String /*!*/ toString() => 'Result.error(exception: $exception)';

  @override
  List<Object /*?*/ > /*!*/ get props => [exception];
}

class ResultDummy extends Result {
  ResultDummy({@required this.data});

  final D /*?*/ data;

  @override
  String /*!*/ toString() => 'Result.dummy(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [data];
}

class ResultPartialSuccess extends Result {
  ResultPartialSuccess({
    @required this.data,
    @required this.exception,
  });

  final D /*?*/ data;
  final E /*?*/ exception;

  @override
  String /*!*/ toString() =>
      'Result.partialSuccess(data: $data, exception: $exception)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
        exception,
      ];
}

class ResultPartialError extends Result {
  ResultPartialError({
    @required this.e,
    @required this.code,
  });

  final E /*?*/ e;
  final int /*?*/ code;

  @override
  String /*!*/ toString() => 'Result.partialError(e: $e, code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        e,
        code,
      ];
}

class ResultDoubleSuccess extends Result {
  ResultDoubleSuccess({
    @required this.data1,
    @required this.data2,
    @required this.code,
  });

  final D /*?*/ data1;
  final D /*?*/ data2;
  final int /*?*/ code;

  @override
  String /*!*/ toString() =>
      'Result.doubleSuccess(data1: $data1, data2: $data2, code: $code)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data1,
        data2,
        code,
      ];
}
