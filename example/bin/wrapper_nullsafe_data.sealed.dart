// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapper_nullsafe_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: null-safe
// no params identified.
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: null-safe
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Wrapper$ {
  void wrap(dynamic data);

  void wrapNullable(dynamic data);
}
// **************************************************************************

@SealedManifest(_Wrapper)
abstract class Wrapper extends Equatable {
  @factory
  WrapperWrap wrap({required dynamic data}) => WrapperWrap(data: data);

  @factory
  WrapperWrapNullable wrapNullable({required dynamic data}) =>
      WrapperWrapNullable(data: data);

  bool isWrap() => this is WrapperWrap;

  bool isWrapNullable() => this is WrapperWrapNullable;

  WrapperWrap asWrap() => this as WrapperWrap;

  WrapperWrapNullable asWrapNullable() => this as WrapperWrapNullable;

  WrapperWrap? asWrapOrNull() =>
      this is WrapperWrap ? this as WrapperWrap : null;

  WrapperWrapNullable? asWrapNullableOrNull() =>
      this is WrapperWrapNullable ? this as WrapperWrapNullable : null;
}

class WrapperWrap extends Wrapper {
  WrapperWrap({required this.data});

  final dynamic data;

  @override
  List<Object?> get props => [];
}

class WrapperWrapNullable extends Wrapper {
  WrapperWrapNullable({required this.data});

  final dynamic data;

  @override
  List<Object?> get props => [];
}
