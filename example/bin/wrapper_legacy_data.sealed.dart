// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'wrapper_legacy_data.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

// **************************************************************************
// compat params generated code:
// language level: legacy
// no params identified.
// **************************************************************************

// **************************************************************************
// backward generated code:
// language level: legacy
@Sealed(equality: SealedEquality.data)
// ignore: unused_element
abstract class _Wrapper$ {
  void wrap(dynamic data);
}
// **************************************************************************

@SealedManifest(_Wrapper)
abstract class Wrapper extends Equatable {
  WrapperWrap /*!*/ wrap({@required dynamic /*!*/ data}) =>
      WrapperWrap(data: data);

  bool isWrap() => this is WrapperWrap;

  WrapperWrap /*!*/ asWrap() => this as WrapperWrap;

  WrapperWrap /*?*/ asWrapOrNull() =>
      this is WrapperWrap ? this as WrapperWrap : null;
}

class WrapperWrap extends Wrapper {
  WrapperWrap({@required this.data});

  final dynamic /*!*/ data;

  @override
  List<Object /*?*/ > get props => [];
}
