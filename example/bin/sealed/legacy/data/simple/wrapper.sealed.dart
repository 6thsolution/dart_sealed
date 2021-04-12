// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.9
part of 'wrapper.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// Wrapper {
///
/// Wrap(dynamic? data)
///
/// }
///
/// with data equality.
@SealedManifest(_Wrapper)
abstract class Wrapper {
  @factory
  static WrapperWrap /*!*/ wrap({
    @required dynamic /*?*/ data,
  }) =>
      WrapperWrap(
        data: data,
      );

  bool isWrap() => this is WrapperWrap /*!*/;

  WrapperWrap /*!*/ asWrap() => this as WrapperWrap /*!*/;

  WrapperWrap /*?*/ asWrapOrNull() {
    final wrapper = this;
    return wrapper is WrapperWrap /*!*/ ? wrapper : null;
  }

  R when<R extends Object /*?*/ >({
    @required R Function(WrapperWrap /*!*/ wrap) /*!*/ wrap,
  }) {
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

  R whenOrDefault<R extends Object /*?*/ >({
    R Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
    @required R orDefault,
  }) {
    assert(orDefault != null);
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      return wrap != null ? wrap(wrapper) : orDefault;
    } else {
      throw AssertionError();
    }
  }

  R /*?*/ whenOrNull<R extends Object /*?*/ >({
    R Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      return wrap?.call(wrapper);
    } else {
      throw AssertionError();
    }
  }

  R whenOrThrow<R extends Object /*?*/ >({
    R Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/ && wrap != null) {
      return wrap(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branch({
    @required void Function(WrapperWrap /*!*/ wrap) /*!*/ wrap,
  }) {
    assert(wrap != null);
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      wrap(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branchPartial({
    void Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      wrap?.call(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branchOrElse({
    void Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
    @required void Function(Wrapper /*!*/ wrapper) /*!*/ orElse,
  }) {
    assert(orElse != null);
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/) {
      (wrap ?? orElse)(wrapper);
    } else {
      throw AssertionError();
    }
  }

  void branchOrThrow({
    void Function(WrapperWrap /*!*/ wrap) /*?*/ wrap,
  }) {
    final wrapper = this;
    if (wrapper is WrapperWrap /*!*/ && wrap != null) {
      wrap(wrapper);
    } else {
      throw AssertionError();
    }
  }
}

class WrapperWrap extends Wrapper with EquatableMixin {
  WrapperWrap({
    @required this.data,
  });

  final dynamic /*?*/ data;

  @override
  String /*!*/ toString() => 'Wrapper.Wrap(data: $data)';

  @override
  List<Object /*?*/ > /*!*/ get props => [
        data,
      ];
}
