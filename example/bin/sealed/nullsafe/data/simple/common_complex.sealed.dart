// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_complex.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Common] {
///
/// {[String] y, [Object]? x}
///
/// ([CommonOne] one){[String] y, [String] x} with data equality
///
/// ([CommonTwo] two){[String] y, [Object] x} with data equality
///
/// ([CommonThree] three){[String] y, [Object]? x} with data equality
///
/// ([CommonFour] four){[String] y, [Object]? x} with data equality
///
/// }
@SealedManifest(_Common)
abstract class Common {
  const Common._internal();

  String get y;

  Object? get x;

  const factory Common.one({
    required String y,
    required String x,
  }) = CommonOne;

  const factory Common.two({
    required String y,
    required Object x,
  }) = CommonTwo;

  const factory Common.three({
    required String y,
    Object? x,
  }) = CommonThree;

  const factory Common.four({
    required String y,
    Object? x,
  }) = CommonFour;

  bool get isOne => this is CommonOne;

  bool get isTwo => this is CommonTwo;

  bool get isThree => this is CommonThree;

  bool get isFour => this is CommonFour;

  CommonOne get asOne => this as CommonOne;

  CommonTwo get asTwo => this as CommonTwo;

  CommonThree get asThree => this as CommonThree;

  CommonFour get asFour => this as CommonFour;

  CommonOne? get asOneOrNull {
    final common = this;
    return common is CommonOne ? common : null;
  }

  CommonTwo? get asTwoOrNull {
    final common = this;
    return common is CommonTwo ? common : null;
  }

  CommonThree? get asThreeOrNull {
    final common = this;
    return common is CommonThree ? common : null;
  }

  CommonFour? get asFourOrNull {
    final common = this;
    return common is CommonFour ? common : null;
  }

  R when<R extends Object?>({
    required R Function(String y, String x) one,
    required R Function(String y, Object x) two,
    required R Function(String y, Object? x) three,
    required R Function(String y, Object? x) four,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one(common.y, common.x);
    } else if (common is CommonTwo) {
      return two(common.y, common.x);
    } else if (common is CommonThree) {
      return three(common.y, common.x);
    } else if (common is CommonFour) {
      return four(common.y, common.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String y, String x)? one,
    R Function(String y, Object x)? two,
    R Function(String y, Object? x)? three,
    R Function(String y, Object? x)? four,
    required R Function(Common common) orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one != null ? one(common.y, common.x) : orElse(common);
    } else if (common is CommonTwo) {
      return two != null ? two(common.y, common.x) : orElse(common);
    } else if (common is CommonThree) {
      return three != null ? three(common.y, common.x) : orElse(common);
    } else if (common is CommonFour) {
      return four != null ? four(common.y, common.x) : orElse(common);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String y, String x)? one,
    void Function(String y, Object x)? two,
    void Function(String y, Object? x)? three,
    void Function(String y, Object? x)? four,
    void Function(Common common)? orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      if (one != null) {
        one(common.y, common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonTwo) {
      if (two != null) {
        two(common.y, common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonThree) {
      if (three != null) {
        three(common.y, common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonFour) {
      if (four != null) {
        four(common.y, common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String y, String x)? one,
    R Function(String y, Object x)? two,
    R Function(String y, Object? x)? three,
    R Function(String y, Object? x)? four,
    R Function(Common common)? orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one != null ? one(common.y, common.x) : orElse?.call(common);
    } else if (common is CommonTwo) {
      return two != null ? two(common.y, common.x) : orElse?.call(common);
    } else if (common is CommonThree) {
      return three != null ? three(common.y, common.x) : orElse?.call(common);
    } else if (common is CommonFour) {
      return four != null ? four(common.y, common.x) : orElse?.call(common);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(CommonOne one) one,
    required R Function(CommonTwo two) two,
    required R Function(CommonThree three) three,
    required R Function(CommonFour four) four,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one(common);
    } else if (common is CommonTwo) {
      return two(common);
    } else if (common is CommonThree) {
      return three(common);
    } else if (common is CommonFour) {
      return four(common);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(CommonOne one)? one,
    R Function(CommonTwo two)? two,
    R Function(CommonThree three)? three,
    R Function(CommonFour four)? four,
    required R Function(Common common) orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one != null ? one(common) : orElse(common);
    } else if (common is CommonTwo) {
      return two != null ? two(common) : orElse(common);
    } else if (common is CommonThree) {
      return three != null ? three(common) : orElse(common);
    } else if (common is CommonFour) {
      return four != null ? four(common) : orElse(common);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(CommonOne one)? one,
    void Function(CommonTwo two)? two,
    void Function(CommonThree three)? three,
    void Function(CommonFour four)? four,
    void Function(Common common)? orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      if (one != null) {
        one(common);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonTwo) {
      if (two != null) {
        two(common);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonThree) {
      if (three != null) {
        three(common);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonFour) {
      if (four != null) {
        four(common);
      } else if (orElse != null) {
        orElse(common);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(CommonOne one)? one,
    R Function(CommonTwo two)? two,
    R Function(CommonThree three)? three,
    R Function(CommonFour four)? four,
    R Function(Common common)? orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one != null ? one(common) : orElse?.call(common);
    } else if (common is CommonTwo) {
      return two != null ? two(common) : orElse?.call(common);
    } else if (common is CommonThree) {
      return three != null ? three(common) : orElse?.call(common);
    } else if (common is CommonFour) {
      return four != null ? four(common) : orElse?.call(common);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CommonOne] : [Common]) one){[String] y, [String] x}
///
/// with data equality
class CommonOne extends Common with EquatableMixin {
  const CommonOne({
    required this.y,
    required this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final String x;

  @override
  String toString() => 'Common.one(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonTwo] : [Common]) two){[String] y, [Object] x}
///
/// with data equality
class CommonTwo extends Common with EquatableMixin {
  const CommonTwo({
    required this.y,
    required this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object x;

  @override
  String toString() => 'Common.two(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonThree] : [Common]) three){[String] y, [Object]? x}
///
/// with data equality
class CommonThree extends Common with EquatableMixin {
  const CommonThree({
    required this.y,
    this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object? x;

  @override
  String toString() => 'Common.three(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonFour] : [Common]) four){[String] y, [Object]? x}
///
/// with data equality
class CommonFour extends Common with EquatableMixin {
  const CommonFour({
    required this.y,
    this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object? x;

  @override
  String toString() => 'Common.four(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// [CommonWithOverride] {
///
/// {[String] y, [Object]? x}
///
/// ([CommonWithOverrideOne] one){[String] y, [String] x} with data equality
///
/// ([CommonWithOverrideTwo] two){[String] y, [Object] x} with data equality
///
/// ([CommonWithOverrideThree] three){[String] y, [Object]? x} with data equality
///
/// ([CommonWithOverrideFour] four){[String] y, [Object]? x} with data equality
///
/// }
@SealedManifest(_CommonWithOverride)
abstract class CommonWithOverride {
  const CommonWithOverride._internal();

  String get y;

  Object? get x;

  const factory CommonWithOverride.one({
    required String y,
    required String x,
  }) = CommonWithOverrideOne;

  const factory CommonWithOverride.two({
    required String y,
    required Object x,
  }) = CommonWithOverrideTwo;

  const factory CommonWithOverride.three({
    required String y,
    Object? x,
  }) = CommonWithOverrideThree;

  const factory CommonWithOverride.four({
    required String y,
    Object? x,
  }) = CommonWithOverrideFour;

  bool get isOne => this is CommonWithOverrideOne;

  bool get isTwo => this is CommonWithOverrideTwo;

  bool get isThree => this is CommonWithOverrideThree;

  bool get isFour => this is CommonWithOverrideFour;

  CommonWithOverrideOne get asOne => this as CommonWithOverrideOne;

  CommonWithOverrideTwo get asTwo => this as CommonWithOverrideTwo;

  CommonWithOverrideThree get asThree => this as CommonWithOverrideThree;

  CommonWithOverrideFour get asFour => this as CommonWithOverrideFour;

  CommonWithOverrideOne? get asOneOrNull {
    final commonWithOverride = this;
    return commonWithOverride is CommonWithOverrideOne
        ? commonWithOverride
        : null;
  }

  CommonWithOverrideTwo? get asTwoOrNull {
    final commonWithOverride = this;
    return commonWithOverride is CommonWithOverrideTwo
        ? commonWithOverride
        : null;
  }

  CommonWithOverrideThree? get asThreeOrNull {
    final commonWithOverride = this;
    return commonWithOverride is CommonWithOverrideThree
        ? commonWithOverride
        : null;
  }

  CommonWithOverrideFour? get asFourOrNull {
    final commonWithOverride = this;
    return commonWithOverride is CommonWithOverrideFour
        ? commonWithOverride
        : null;
  }

  R when<R extends Object?>({
    required R Function(String y, String x) one,
    required R Function(String y, Object x) two,
    required R Function(String y, Object? x) three,
    required R Function(String y, Object? x) four,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one(commonWithOverride.y, commonWithOverride.x);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two(commonWithOverride.y, commonWithOverride.x);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three(commonWithOverride.y, commonWithOverride.x);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four(commonWithOverride.y, commonWithOverride.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String y, String x)? one,
    R Function(String y, Object x)? two,
    R Function(String y, Object? x)? three,
    R Function(String y, Object? x)? four,
    required R Function(CommonWithOverride commonWithOverride) orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one != null
          ? one(commonWithOverride.y, commonWithOverride.x)
          : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two != null
          ? two(commonWithOverride.y, commonWithOverride.x)
          : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three != null
          ? three(commonWithOverride.y, commonWithOverride.x)
          : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four != null
          ? four(commonWithOverride.y, commonWithOverride.x)
          : orElse(commonWithOverride);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String y, String x)? one,
    void Function(String y, Object x)? two,
    void Function(String y, Object? x)? three,
    void Function(String y, Object? x)? four,
    void Function(CommonWithOverride commonWithOverride)? orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      if (one != null) {
        one(commonWithOverride.y, commonWithOverride.x);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      if (two != null) {
        two(commonWithOverride.y, commonWithOverride.x);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideThree) {
      if (three != null) {
        three(commonWithOverride.y, commonWithOverride.x);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideFour) {
      if (four != null) {
        four(commonWithOverride.y, commonWithOverride.x);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String y, String x)? one,
    R Function(String y, Object x)? two,
    R Function(String y, Object? x)? three,
    R Function(String y, Object? x)? four,
    R Function(CommonWithOverride commonWithOverride)? orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one != null
          ? one(commonWithOverride.y, commonWithOverride.x)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two != null
          ? two(commonWithOverride.y, commonWithOverride.x)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three != null
          ? three(commonWithOverride.y, commonWithOverride.x)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four != null
          ? four(commonWithOverride.y, commonWithOverride.x)
          : orElse?.call(commonWithOverride);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(CommonWithOverrideOne one) one,
    required R Function(CommonWithOverrideTwo two) two,
    required R Function(CommonWithOverrideThree three) three,
    required R Function(CommonWithOverrideFour four) four,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four(commonWithOverride);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(CommonWithOverrideOne one)? one,
    R Function(CommonWithOverrideTwo two)? two,
    R Function(CommonWithOverrideThree three)? three,
    R Function(CommonWithOverrideFour four)? four,
    required R Function(CommonWithOverride commonWithOverride) orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one != null ? one(commonWithOverride) : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two != null ? two(commonWithOverride) : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three != null
          ? three(commonWithOverride)
          : orElse(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four != null
          ? four(commonWithOverride)
          : orElse(commonWithOverride);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(CommonWithOverrideOne one)? one,
    void Function(CommonWithOverrideTwo two)? two,
    void Function(CommonWithOverrideThree three)? three,
    void Function(CommonWithOverrideFour four)? four,
    void Function(CommonWithOverride commonWithOverride)? orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      if (one != null) {
        one(commonWithOverride);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      if (two != null) {
        two(commonWithOverride);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideThree) {
      if (three != null) {
        three(commonWithOverride);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else if (commonWithOverride is CommonWithOverrideFour) {
      if (four != null) {
        four(commonWithOverride);
      } else if (orElse != null) {
        orElse(commonWithOverride);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(CommonWithOverrideOne one)? one,
    R Function(CommonWithOverrideTwo two)? two,
    R Function(CommonWithOverrideThree three)? three,
    R Function(CommonWithOverrideFour four)? four,
    R Function(CommonWithOverride commonWithOverride)? orElse,
  }) {
    final commonWithOverride = this;
    if (commonWithOverride is CommonWithOverrideOne) {
      return one != null
          ? one(commonWithOverride)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideTwo) {
      return two != null
          ? two(commonWithOverride)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideThree) {
      return three != null
          ? three(commonWithOverride)
          : orElse?.call(commonWithOverride);
    } else if (commonWithOverride is CommonWithOverrideFour) {
      return four != null
          ? four(commonWithOverride)
          : orElse?.call(commonWithOverride);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CommonWithOverrideOne] : [CommonWithOverride]) one){[String] y, [String] x}
///
/// with data equality
class CommonWithOverrideOne extends CommonWithOverride with EquatableMixin {
  const CommonWithOverrideOne({
    required this.y,
    required this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final String x;

  @override
  String toString() => 'CommonWithOverride.one(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonWithOverrideTwo] : [CommonWithOverride]) two){[String] y, [Object] x}
///
/// with data equality
class CommonWithOverrideTwo extends CommonWithOverride with EquatableMixin {
  const CommonWithOverrideTwo({
    required this.y,
    required this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object x;

  @override
  String toString() => 'CommonWithOverride.two(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonWithOverrideThree] : [CommonWithOverride]) three){[String] y, [Object]? x}
///
/// with data equality
class CommonWithOverrideThree extends CommonWithOverride with EquatableMixin {
  const CommonWithOverrideThree({
    required this.y,
    this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object? x;

  @override
  String toString() => 'CommonWithOverride.three(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// (([CommonWithOverrideFour] : [CommonWithOverride]) four){[String] y, [Object]? x}
///
/// with data equality
class CommonWithOverrideFour extends CommonWithOverride with EquatableMixin {
  const CommonWithOverrideFour({
    required this.y,
    this.x,
  }) : super._internal();

  @override
  final String y;
  @override
  final Object? x;

  @override
  String toString() => 'CommonWithOverride.four(y: $y, x: $x)';

  @override
  List<Object?> get props => [
        y,
        x,
      ];
}

/// [CommonHierarchy] {
///
/// {[Common] x}
///
/// ([CommonHierarchyOne] one){[Common] x} with data equality
///
/// }
@SealedManifest(_CommonHierarchy)
abstract class CommonHierarchy {
  const CommonHierarchy._internal();

  Common get x;

  const factory CommonHierarchy.one({
    required Common x,
  }) = CommonHierarchyOne;

  bool get isOne => this is CommonHierarchyOne;

  CommonHierarchyOne get asOne => this as CommonHierarchyOne;

  CommonHierarchyOne? get asOneOrNull {
    final commonHierarchy = this;
    return commonHierarchy is CommonHierarchyOne ? commonHierarchy : null;
  }

  R when<R extends Object?>({
    required R Function(Common x) one,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one(commonHierarchy.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Common x)? one,
    required R Function(CommonHierarchy commonHierarchy) orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one != null ? one(commonHierarchy.x) : orElse(commonHierarchy);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Common x)? one,
    void Function(CommonHierarchy commonHierarchy)? orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      if (one != null) {
        one(commonHierarchy.x);
      } else if (orElse != null) {
        orElse(commonHierarchy);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Common x)? one,
    R Function(CommonHierarchy commonHierarchy)? orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one != null
          ? one(commonHierarchy.x)
          : orElse?.call(commonHierarchy);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(CommonHierarchyOne one) one,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one(commonHierarchy);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(CommonHierarchyOne one)? one,
    required R Function(CommonHierarchy commonHierarchy) orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one != null ? one(commonHierarchy) : orElse(commonHierarchy);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(CommonHierarchyOne one)? one,
    void Function(CommonHierarchy commonHierarchy)? orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      if (one != null) {
        one(commonHierarchy);
      } else if (orElse != null) {
        orElse(commonHierarchy);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(CommonHierarchyOne one)? one,
    R Function(CommonHierarchy commonHierarchy)? orElse,
  }) {
    final commonHierarchy = this;
    if (commonHierarchy is CommonHierarchyOne) {
      return one != null ? one(commonHierarchy) : orElse?.call(commonHierarchy);
    } else {
      throw AssertionError();
    }
  }
}

/// (([CommonHierarchyOne] : [CommonHierarchy]) one){[Common] x}
///
/// with data equality
class CommonHierarchyOne extends CommonHierarchy with EquatableMixin {
  const CommonHierarchyOne({
    required this.x,
  }) : super._internal();

  @override
  final Common x;

  @override
  String toString() => 'CommonHierarchy.one(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}
