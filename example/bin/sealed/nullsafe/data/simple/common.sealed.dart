// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ApiError] {
///
/// {[String] message, [String]? code}
///
/// ([ApiErrorInternetError] internetError){[String] message, [String]? code} with data equality
///
/// ([ApiErrorBadRequest] badRequest){[String] message, [String]? code} with data equality
///
/// ([ApiErrorInternalError] internalError){[String] message, [String]? code, [Object]? error} with data equality
///
/// }
@SealedManifest(_ApiError)
abstract class ApiError {
  const ApiError._internal();

  String get message;

  String? get code;

  const factory ApiError.internetError({
    required String message,
    String? code,
  }) = ApiErrorInternetError;

  const factory ApiError.badRequest({
    required String message,
    String? code,
  }) = ApiErrorBadRequest;

  const factory ApiError.internalError({
    required String message,
    String? code,
    Object? error,
  }) = ApiErrorInternalError;

  bool get isInternetError => this is ApiErrorInternetError;

  bool get isBadRequest => this is ApiErrorBadRequest;

  bool get isInternalError => this is ApiErrorInternalError;

  ApiErrorInternetError get asInternetError => this as ApiErrorInternetError;

  ApiErrorBadRequest get asBadRequest => this as ApiErrorBadRequest;

  ApiErrorInternalError get asInternalError => this as ApiErrorInternalError;

  ApiErrorInternetError? get asInternetErrorOrNull {
    final apiError = this;
    return apiError is ApiErrorInternetError ? apiError : null;
  }

  ApiErrorBadRequest? get asBadRequestOrNull {
    final apiError = this;
    return apiError is ApiErrorBadRequest ? apiError : null;
  }

  ApiErrorInternalError? get asInternalErrorOrNull {
    final apiError = this;
    return apiError is ApiErrorInternalError ? apiError : null;
  }

  R when<R extends Object?>({
    required R Function(String message, String? code) internetError,
    required R Function(String message, String? code) badRequest,
    required R Function(String message, String? code, Object? error)
        internalError,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError(apiError.message, apiError.code);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest(apiError.message, apiError.code);
    } else if (apiError is ApiErrorInternalError) {
      return internalError(apiError.message, apiError.code, apiError.error);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String message, String? code)? internetError,
    R Function(String message, String? code)? badRequest,
    R Function(String message, String? code, Object? error)? internalError,
    required R Function(ApiError apiError) orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError != null
          ? internetError(apiError.message, apiError.code)
          : orElse(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest != null
          ? badRequest(apiError.message, apiError.code)
          : orElse(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError != null
          ? internalError(apiError.message, apiError.code, apiError.error)
          : orElse(apiError);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String message, String? code)? internetError,
    void Function(String message, String? code)? badRequest,
    void Function(String message, String? code, Object? error)? internalError,
    void Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      if (internetError != null) {
        internetError(apiError.message, apiError.code);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorBadRequest) {
      if (badRequest != null) {
        badRequest(apiError.message, apiError.code);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorInternalError) {
      if (internalError != null) {
        internalError(apiError.message, apiError.code, apiError.error);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String message, String? code)? internetError,
    R Function(String message, String? code)? badRequest,
    R Function(String message, String? code, Object? error)? internalError,
    R Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError != null
          ? internetError(apiError.message, apiError.code)
          : orElse?.call(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest != null
          ? badRequest(apiError.message, apiError.code)
          : orElse?.call(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError != null
          ? internalError(apiError.message, apiError.code, apiError.error)
          : orElse?.call(apiError);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ApiErrorInternetError internetError) internetError,
    required R Function(ApiErrorBadRequest badRequest) badRequest,
    required R Function(ApiErrorInternalError internalError) internalError,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError(apiError);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ApiErrorInternetError internetError)? internetError,
    R Function(ApiErrorBadRequest badRequest)? badRequest,
    R Function(ApiErrorInternalError internalError)? internalError,
    required R Function(ApiError apiError) orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError != null ? internetError(apiError) : orElse(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest != null ? badRequest(apiError) : orElse(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError != null ? internalError(apiError) : orElse(apiError);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ApiErrorInternetError internetError)? internetError,
    void Function(ApiErrorBadRequest badRequest)? badRequest,
    void Function(ApiErrorInternalError internalError)? internalError,
    void Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      if (internetError != null) {
        internetError(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorBadRequest) {
      if (badRequest != null) {
        badRequest(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorInternalError) {
      if (internalError != null) {
        internalError(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ApiErrorInternetError internetError)? internetError,
    R Function(ApiErrorBadRequest badRequest)? badRequest,
    R Function(ApiErrorInternalError internalError)? internalError,
    R Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError != null
          ? internetError(apiError)
          : orElse?.call(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest != null ? badRequest(apiError) : orElse?.call(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError != null
          ? internalError(apiError)
          : orElse?.call(apiError);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ApiErrorInternetError] : [ApiError]) internetError){[String] message, [String]? code}
///
/// with data equality
class ApiErrorInternetError extends ApiError with EquatableMixin {
  const ApiErrorInternetError({
    required this.message,
    this.code,
  }) : super._internal();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() => 'ApiError.internetError(message: $message, code: $code)';

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

/// (([ApiErrorBadRequest] : [ApiError]) badRequest){[String] message, [String]? code}
///
/// with data equality
class ApiErrorBadRequest extends ApiError with EquatableMixin {
  const ApiErrorBadRequest({
    required this.message,
    this.code,
  }) : super._internal();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() => 'ApiError.badRequest(message: $message, code: $code)';

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

/// (([ApiErrorInternalError] : [ApiError]) internalError){[String] message, [String]? code, [Object]? error}
///
/// with data equality
class ApiErrorInternalError extends ApiError with EquatableMixin {
  const ApiErrorInternalError({
    required this.message,
    this.code,
    this.error,
  }) : super._internal();

  @override
  final String message;
  @override
  final String? code;
  final Object? error;

  @override
  String toString() =>
      'ApiError.internalError(message: $message, code: $code, error: $error)';

  @override
  List<Object?> get props => [
        message,
        code,
        error,
      ];
}
