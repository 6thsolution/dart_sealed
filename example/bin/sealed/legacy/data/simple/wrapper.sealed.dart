// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'wrapper.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Wrapper {
///
/// Wrap(dynamic data)
///
/// }
///
/// with data equality.
@SealedManifest(_Wrapper)
abstract class Wrapper extends Equatable {
  @factory
  static WrapperWrap /*!*/ wrap({@required dynamic /*!*/ data}) =>
      WrapperWrap(data: data);

  bool isWrap() => this is WrapperWrap /*!*/;

  WrapperWrap /*!*/ asWrap() => this as WrapperWrap /*!*/;

  WrapperWrap /*?*/ asWrapOrNull() {
    final wrapper = this;
    return wrapper is WrapperWrap /*!*/ ? wrapper : null;
  }

  R when<R extends Object /*?*/ >(
      {@required R Function(WrapperWrap /*!*/ wrap) /*!*/ wrap}) {
    assert(wrap != null);
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      return wrap(wrapper);
    } else {
      throw AssertionError();
    }
  }

  R whenOrElse<R extends Object /*?*/ >({
    R Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
    @required R Function(Wrapper /*!*/ wrapper) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      return (wrap ?? orElse)(wrapper);
    } else {
      throw AssertionError();
    }
  }
}

class WrapperWrap extends Wrapper {
  WrapperWrap({@required this.data});

  final dynamic /*!*/ data;

  @factory
  WrapperWrap /*!*/ copy({dynamic /*?*/ data}) =>
      WrapperWrap(data: data ?? this.data);

  @override
  String /*!*/ toString() => 'Wrapper.wrap(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [data];
}
