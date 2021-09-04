// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ApiError] {
///
/// ([ApiErrorInternetError] internetError){} with data equality
///
/// ([ApiErrorBadRequest] badRequest){} with data equality
///
/// ([ApiErrorInternalError] internalError){[Object]? error} with data equality
///
/// }
@SealedManifest(_ApiError)
abstract class ApiError {
  const ApiError._internal();

  const factory ApiError.internetError() = ApiErrorInternetError;

  const factory ApiError.badRequest() = ApiErrorBadRequest;

  const factory ApiError.internalError({
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
    required R Function() internetError,
    required R Function() badRequest,
    required R Function(Object? error) internalError,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError();
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest();
    } else if (apiError is ApiErrorInternalError) {
      return internalError(apiError.error);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? internetError,
    R Function()? badRequest,
    R Function(Object? error)? internalError,
    required R Function(ApiError apiError) orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      return internetError != null ? internetError() : orElse(apiError);
    } else if (apiError is ApiErrorBadRequest) {
      return badRequest != null ? badRequest() : orElse(apiError);
    } else if (apiError is ApiErrorInternalError) {
      return internalError != null
          ? internalError(apiError.error)
          : orElse(apiError);
    } else {
      throw AssertionError();
    }
  }

  void partialWhen({
    void Function()? internetError,
    void Function()? badRequest,
    void Function(Object? error)? internalError,
    void Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is ApiErrorInternetError) {
      if (internetError != null) {
        internetError();
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorBadRequest) {
      if (badRequest != null) {
        badRequest();
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ApiErrorInternalError) {
      if (internalError != null) {
        internalError(apiError.error);
      } else if (orElse != null) {
        orElse(apiError);
      }
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
}

/// (([ApiErrorInternetError] : [ApiError]) internetError){}
///
/// with data equality
class ApiErrorInternetError extends ApiError with EquatableMixin {
  const ApiErrorInternetError() : super._internal();

  @override
  String toString() => 'ApiError.internetError()';

  @override
  List<Object?> get props => [];
}

/// (([ApiErrorBadRequest] : [ApiError]) badRequest){}
///
/// with data equality
class ApiErrorBadRequest extends ApiError with EquatableMixin {
  const ApiErrorBadRequest() : super._internal();

  @override
  String toString() => 'ApiError.badRequest()';

  @override
  List<Object?> get props => [];
}

/// (([ApiErrorInternalError] : [ApiError]) internalError){[Object]? error}
///
/// with data equality
class ApiErrorInternalError extends ApiError with EquatableMixin {
  const ApiErrorInternalError({
    this.error,
  }) : super._internal();

  final Object? error;

  @override
  String toString() => 'ApiError.internalError(error: $error)';

  @override
  List<Object?> get props => [
        error,
      ];
}
