// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_complex.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Common] {
///
/// ([CommonOne] one){[String] x} with data equality
///
/// ([CommonTwo] two){[Object] x} with data equality
///
/// ([CommonThree] three){} with data equality
///
/// ([CommonFour] four){[Object]? x} with data equality
///
/// }
@SealedManifest(_Common)
abstract class Common {
  const Common._internal();

  const factory Common.one({
    required String x,
  }) = CommonOne;

  const factory Common.two({
    required Object x,
  }) = CommonTwo;

  const factory Common.three() = CommonThree;

  const factory Common.four({
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
    required R Function(String x) one,
    required R Function(Object x) two,
    required R Function() three,
    required R Function(Object? x) four,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one(common.x);
    } else if (common is CommonTwo) {
      return two(common.x);
    } else if (common is CommonThree) {
      return three();
    } else if (common is CommonFour) {
      return four(common.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String x)? one,
    R Function(Object x)? two,
    R Function()? three,
    R Function(Object? x)? four,
    required R Function(Common common) orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      return one != null ? one(common.x) : orElse(common);
    } else if (common is CommonTwo) {
      return two != null ? two(common.x) : orElse(common);
    } else if (common is CommonThree) {
      return three != null ? three() : orElse(common);
    } else if (common is CommonFour) {
      return four != null ? four(common.x) : orElse(common);
    } else {
      throw AssertionError();
    }
  }

  void partialWhen({
    void Function(String x)? one,
    void Function(Object x)? two,
    void Function()? three,
    void Function(Object? x)? four,
    void Function(Common common)? orElse,
  }) {
    final common = this;
    if (common is CommonOne) {
      if (one != null) {
        one(common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonTwo) {
      if (two != null) {
        two(common.x);
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonThree) {
      if (three != null) {
        three();
      } else if (orElse != null) {
        orElse(common);
      }
    } else if (common is CommonFour) {
      if (four != null) {
        four(common.x);
      } else if (orElse != null) {
        orElse(common);
      }
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
}

/// (([CommonOne] : [Common]) one){[String] x}
///
/// with data equality
class CommonOne extends Common with EquatableMixin {
  const CommonOne({
    required this.x,
  }) : super._internal();

  final String x;

  @override
  String toString() => 'Common.one(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([CommonTwo] : [Common]) two){[Object] x}
///
/// with data equality
class CommonTwo extends Common with EquatableMixin {
  const CommonTwo({
    required this.x,
  }) : super._internal();

  final Object x;

  @override
  String toString() => 'Common.two(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([CommonThree] : [Common]) three){}
///
/// with data equality
class CommonThree extends Common with EquatableMixin {
  const CommonThree() : super._internal();

  @override
  String toString() => 'Common.three()';

  @override
  List<Object?> get props => [];
}

/// (([CommonFour] : [Common]) four){[Object]? x}
///
/// with data equality
class CommonFour extends Common with EquatableMixin {
  const CommonFour({
    this.x,
  }) : super._internal();

  final Object? x;

  @override
  String toString() => 'Common.four(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}
