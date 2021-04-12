// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapper.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Wrapper {
///
/// Wrap(dynamic data)
///
/// WrapNullable(dynamic data)
///
/// }
///
/// with data equality.
@SealedManifest(_Wrapper)
abstract class Wrapper {
  @factory
  static WrapperWrap wrap({
    required dynamic data,
  }) =>
      WrapperWrap(
        data: data,
      );

  @factory
  static WrapperWrapNullable wrapNullable({
    required dynamic data,
  }) =>
      WrapperWrapNullable(
        data: data,
      );

  bool isWrap() => this is WrapperWrap;

  bool isWrapNullable() => this is WrapperWrapNullable;

  WrapperWrap asWrap() => this as WrapperWrap;

  WrapperWrapNullable asWrapNullable() => this as WrapperWrapNullable;

  WrapperWrap? asWrapOrNull() {
    final wrapper = this;
    return wrapper is WrapperWrap ? wrapper : null;
  }

  WrapperWrapNullable? asWrapNullableOrNull() {
    final wrapper = this;
    return wrapper is WrapperWrapNullable ? wrapper : null;
  }

  R when<R extends Object?>({
    required R Function(WrapperWrap wrap) wrap,
    required R Function(WrapperWrapNullable wrapNullable) wrapNullable,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      return wrap(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      return wrapNullable(wrapper);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object?>({
    R Function(WrapperWrap wrap)? wrap,
    R Function(WrapperWrapNullable wrapNullable)? wrapNullable,
    required R Function(Wrapper wrapper) orElse,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      return (wrap ?? orElse)(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      return (wrapNullable ?? orElse)(wrapper);
    } else {
      throw AssertionError();
    }
  }

  R whenOrDefault<R extends Object?>({
    R Function(WrapperWrap wrap)? wrap,
    R Function(WrapperWrapNullable wrapNullable)? wrapNullable,
    required R orDefault,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      return wrap?.call(wrapper) ?? orDefault;
    } else if (wrapper is WrapperWrapNullable) {
      return wrapNullable?.call(wrapper) ?? orDefault;
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(WrapperWrap wrap)? wrap,
    R Function(WrapperWrapNullable wrapNullable)? wrapNullable,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      return wrap?.call(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      return wrapNullable?.call(wrapper);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object?>({
    R Function(WrapperWrap wrap)? wrap,
    R Function(WrapperWrapNullable wrapNullable)? wrapNullable,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap && wrap != null) {
      return wrap(wrapper);
    } else if (wrapper is WrapperWrapNullable && wrapNullable != null) {
      return wrapNullable(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    required void Function(WrapperWrap wrap) wrap,
    required void Function(WrapperWrapNullable wrapNullable) wrapNullable,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      wrap(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      wrapNullable(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(WrapperWrap wrap)? wrap,
    void Function(WrapperWrapNullable wrapNullable)? wrapNullable,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      wrap?.call(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      wrapNullable?.call(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(WrapperWrap wrap)? wrap,
    void Function(WrapperWrapNullable wrapNullable)? wrapNullable,
    required void Function(Wrapper wrapper) orElse,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap) {
      (wrap ?? orElse)(wrapper);
    } else if (wrapper is WrapperWrapNullable) {
      (wrapNullable ?? orElse)(wrapper);
    } else {
      throw AssertionError();
    }
  }
}

class WrapperWrap extends Wrapper with EquatableMixin {
  WrapperWrap({
    required this.data,
  });

  final dynamic data;

  @factory
  WrapperWrap copy({
    dynamic? data,
  }) =>
      WrapperWrap(
        data: data ?? this.data,
      );

  @override
  String toString() => 'Wrapper.wrap(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

class WrapperWrapNullable extends Wrapper with EquatableMixin {
  WrapperWrapNullable({
    required this.data,
  });

  final dynamic data;

  @factory
  WrapperWrapNullable copy({
    dynamic? data,
  }) =>
      WrapperWrapNullable(
        data: data ?? this.data,
      );

  @override
  String toString() => 'Wrapper.wrapNullable(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}
