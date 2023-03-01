// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Weather] {
///
/// ([PrefixSunny] sunny){} with data equality
///
/// ([BadWeather] rainy){[int] rain} with data equality
///
/// ([VeryBadWeather] windy){[double] velocity, [double]? angle} with distinct equality
///
/// }
@SealedManifest(_Weather)
abstract class Weather {
  const Weather._internal();

  const factory Weather.rainy({
    required int rain,
  }) = BadWeather;

  const factory Weather.windy({
    required double velocity,
    double? angle,
  }) = VeryBadWeather;

  static const Weather sunny = PrefixSunny();

  bool get isSunny => this is PrefixSunny;

  bool get isRainy => this is BadWeather;

  bool get isWindy => this is VeryBadWeather;

  PrefixSunny get asSunny => this as PrefixSunny;

  BadWeather get asRainy => this as BadWeather;

  VeryBadWeather get asWindy => this as VeryBadWeather;

  PrefixSunny? get asSunnyOrNull {
    final weather = this;
    return weather is PrefixSunny ? weather : null;
  }

  BadWeather? get asRainyOrNull {
    final weather = this;
    return weather is BadWeather ? weather : null;
  }

  VeryBadWeather? get asWindyOrNull {
    final weather = this;
    return weather is VeryBadWeather ? weather : null;
  }

  R when<R extends Object?>({
    required R Function() sunny,
    required R Function(int rain) rainy,
    required R Function(double velocity, double? angle) windy,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny();
    } else if (weather is BadWeather) {
      return rainy(weather.rain);
    } else if (weather is VeryBadWeather) {
      return windy(weather.velocity, weather.angle);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? sunny,
    R Function(int rain)? rainy,
    R Function(double velocity, double? angle)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny != null ? sunny() : orElse(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather.rain) : orElse(weather);
    } else if (weather is VeryBadWeather) {
      return windy != null
          ? windy(weather.velocity, weather.angle)
          : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function()? sunny,
    void Function(int rain)? rainy,
    void Function(double velocity, double? angle)? windy,
    void Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      if (sunny != null) {
        sunny();
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is BadWeather) {
      if (rainy != null) {
        rainy(weather.rain);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is VeryBadWeather) {
      if (windy != null) {
        windy(weather.velocity, weather.angle);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? sunny,
    R Function(int rain)? rainy,
    R Function(double velocity, double? angle)? windy,
    R Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny != null ? sunny() : orElse?.call(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather.rain) : orElse?.call(weather);
    } else if (weather is VeryBadWeather) {
      return windy != null
          ? windy(weather.velocity, weather.angle)
          : orElse?.call(weather);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(PrefixSunny sunny) sunny,
    required R Function(BadWeather rainy) rainy,
    required R Function(VeryBadWeather windy) windy,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny(weather);
    } else if (weather is BadWeather) {
      return rainy(weather);
    } else if (weather is VeryBadWeather) {
      return windy(weather);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(PrefixSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
    required R Function(Weather weather) orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny != null ? sunny(weather) : orElse(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather) : orElse(weather);
    } else if (weather is VeryBadWeather) {
      return windy != null ? windy(weather) : orElse(weather);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(PrefixSunny sunny)? sunny,
    void Function(BadWeather rainy)? rainy,
    void Function(VeryBadWeather windy)? windy,
    void Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      if (sunny != null) {
        sunny(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is BadWeather) {
      if (rainy != null) {
        rainy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else if (weather is VeryBadWeather) {
      if (windy != null) {
        windy(weather);
      } else if (orElse != null) {
        orElse(weather);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(PrefixSunny sunny)? sunny,
    R Function(BadWeather rainy)? rainy,
    R Function(VeryBadWeather windy)? windy,
    R Function(Weather weather)? orElse,
  }) {
    final weather = this;
    if (weather is PrefixSunny) {
      return sunny != null ? sunny(weather) : orElse?.call(weather);
    } else if (weather is BadWeather) {
      return rainy != null ? rainy(weather) : orElse?.call(weather);
    } else if (weather is VeryBadWeather) {
      return windy != null ? windy(weather) : orElse?.call(weather);
    } else {
      throw AssertionError();
    }
  }
}

/// (([PrefixSunny] : [Weather]) sunny){}
///
/// with data equality
class PrefixSunny extends Weather with EquatableMixin {
  const PrefixSunny() : super._internal();

  @override
  String toString() => 'Weather.sunny()';

  @override
  List<Object?> get props => [];
}

/// (([BadWeather] : [Weather]) rainy){[int] rain}
///
/// with data equality
class BadWeather extends Weather with EquatableMixin {
  const BadWeather({
    required this.rain,
  }) : super._internal();

  final int rain;

  @override
  String toString() => 'Weather.rainy(rain: $rain)';

  @override
  List<Object?> get props => [
        rain,
      ];
}

/// (([VeryBadWeather] : [Weather]) windy){[double] velocity, [double]? angle}
///
/// with distinct equality
class VeryBadWeather extends Weather {
  const VeryBadWeather({
    required this.velocity,
    this.angle,
  }) : super._internal();

  final double velocity;
  final double? angle;

  @override
  String toString() => 'Weather.windy(velocity: $velocity, angle: $angle)';

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => 0;
}

/// [ApiError] {
///
/// ([InternetError] internetError){} with data equality
///
/// ([ServerError] serverError){[int] code} with data equality
///
/// ([OtherError] otherError){[String]? message} with data equality
///
/// }
@SealedManifest(_ApiError)
abstract class ApiError {
  const ApiError._internal();

  const factory ApiError.serverError({
    required int code,
  }) = ServerError;

  const factory ApiError.otherError({
    String? message,
  }) = OtherError;

  static const ApiError internetError = InternetError();

  bool get isInternetError => this is InternetError;

  bool get isServerError => this is ServerError;

  bool get isOtherError => this is OtherError;

  InternetError get asInternetError => this as InternetError;

  ServerError get asServerError => this as ServerError;

  OtherError get asOtherError => this as OtherError;

  InternetError? get asInternetErrorOrNull {
    final apiError = this;
    return apiError is InternetError ? apiError : null;
  }

  ServerError? get asServerErrorOrNull {
    final apiError = this;
    return apiError is ServerError ? apiError : null;
  }

  OtherError? get asOtherErrorOrNull {
    final apiError = this;
    return apiError is OtherError ? apiError : null;
  }

  R when<R extends Object?>({
    required R Function() internetError,
    required R Function(int code) serverError,
    required R Function(String? message) otherError,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError();
    } else if (apiError is ServerError) {
      return serverError(apiError.code);
    } else if (apiError is OtherError) {
      return otherError(apiError.message);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? internetError,
    R Function(int code)? serverError,
    R Function(String? message)? otherError,
    required R Function(ApiError apiError) orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError != null ? internetError() : orElse(apiError);
    } else if (apiError is ServerError) {
      return serverError != null
          ? serverError(apiError.code)
          : orElse(apiError);
    } else if (apiError is OtherError) {
      return otherError != null
          ? otherError(apiError.message)
          : orElse(apiError);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function()? internetError,
    void Function(int code)? serverError,
    void Function(String? message)? otherError,
    void Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      if (internetError != null) {
        internetError();
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ServerError) {
      if (serverError != null) {
        serverError(apiError.code);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is OtherError) {
      if (otherError != null) {
        otherError(apiError.message);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? internetError,
    R Function(int code)? serverError,
    R Function(String? message)? otherError,
    R Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError != null ? internetError() : orElse?.call(apiError);
    } else if (apiError is ServerError) {
      return serverError != null
          ? serverError(apiError.code)
          : orElse?.call(apiError);
    } else if (apiError is OtherError) {
      return otherError != null
          ? otherError(apiError.message)
          : orElse?.call(apiError);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(InternetError internetError) internetError,
    required R Function(ServerError serverError) serverError,
    required R Function(OtherError otherError) otherError,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError(apiError);
    } else if (apiError is ServerError) {
      return serverError(apiError);
    } else if (apiError is OtherError) {
      return otherError(apiError);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(InternetError internetError)? internetError,
    R Function(ServerError serverError)? serverError,
    R Function(OtherError otherError)? otherError,
    required R Function(ApiError apiError) orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError != null ? internetError(apiError) : orElse(apiError);
    } else if (apiError is ServerError) {
      return serverError != null ? serverError(apiError) : orElse(apiError);
    } else if (apiError is OtherError) {
      return otherError != null ? otherError(apiError) : orElse(apiError);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(InternetError internetError)? internetError,
    void Function(ServerError serverError)? serverError,
    void Function(OtherError otherError)? otherError,
    void Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      if (internetError != null) {
        internetError(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is ServerError) {
      if (serverError != null) {
        serverError(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else if (apiError is OtherError) {
      if (otherError != null) {
        otherError(apiError);
      } else if (orElse != null) {
        orElse(apiError);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(InternetError internetError)? internetError,
    R Function(ServerError serverError)? serverError,
    R Function(OtherError otherError)? otherError,
    R Function(ApiError apiError)? orElse,
  }) {
    final apiError = this;
    if (apiError is InternetError) {
      return internetError != null
          ? internetError(apiError)
          : orElse?.call(apiError);
    } else if (apiError is ServerError) {
      return serverError != null
          ? serverError(apiError)
          : orElse?.call(apiError);
    } else if (apiError is OtherError) {
      return otherError != null ? otherError(apiError) : orElse?.call(apiError);
    } else {
      throw AssertionError();
    }
  }
}

/// (([InternetError] : [ApiError]) internetError){}
///
/// with data equality
class InternetError extends ApiError with EquatableMixin {
  const InternetError() : super._internal();

  @override
  String toString() => 'ApiError.internetError()';

  @override
  List<Object?> get props => [];
}

/// (([ServerError] : [ApiError]) serverError){[int] code}
///
/// with data equality
class ServerError extends ApiError with EquatableMixin {
  const ServerError({
    required this.code,
  }) : super._internal();

  final int code;

  @override
  String toString() => 'ApiError.serverError(code: $code)';

  @override
  List<Object?> get props => [
        code,
      ];
}

/// (([OtherError] : [ApiError]) otherError){[String]? message}
///
/// with data equality
class OtherError extends ApiError with EquatableMixin {
  const OtherError({
    this.message,
  }) : super._internal();

  final String? message;

  @override
  String toString() => 'ApiError.otherError(message: $message)';

  @override
  List<Object?> get props => [
        message,
      ];
}
