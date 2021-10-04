// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'functional.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Functional1] {
///
/// ([Functional1One] one){[int Function(double)] x} with data equality
///
/// ([Functional1Two] two){[int Function(double)]? x} with data equality
///
/// ([Functional1Three] three){[int Function(double)]? x} with data equality
///
/// }
@SealedManifest(_Functional1)
abstract class Functional1 {
  const Functional1._internal();

  const factory Functional1.one({
    required int Function(double) x,
  }) = Functional1One;

  const factory Functional1.two({
    int Function(double)? x,
  }) = Functional1Two;

  const factory Functional1.three({
    int Function(double)? x,
  }) = Functional1Three;

  bool get isOne => this is Functional1One;

  bool get isTwo => this is Functional1Two;

  bool get isThree => this is Functional1Three;

  Functional1One get asOne => this as Functional1One;

  Functional1Two get asTwo => this as Functional1Two;

  Functional1Three get asThree => this as Functional1Three;

  Functional1One? get asOneOrNull {
    final functional1 = this;
    return functional1 is Functional1One ? functional1 : null;
  }

  Functional1Two? get asTwoOrNull {
    final functional1 = this;
    return functional1 is Functional1Two ? functional1 : null;
  }

  Functional1Three? get asThreeOrNull {
    final functional1 = this;
    return functional1 is Functional1Three ? functional1 : null;
  }

  R when<R extends Object?>({
    required R Function(int Function(double) x) one,
    required R Function(int Function(double)? x) two,
    required R Function(int Function(double)? x) three,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one(functional1.x);
    } else if (functional1 is Functional1Two) {
      return two(functional1.x);
    } else if (functional1 is Functional1Three) {
      return three(functional1.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(int Function(double) x)? one,
    R Function(int Function(double)? x)? two,
    R Function(int Function(double)? x)? three,
    required R Function(Functional1 functional1) orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one != null ? one(functional1.x) : orElse(functional1);
    } else if (functional1 is Functional1Two) {
      return two != null ? two(functional1.x) : orElse(functional1);
    } else if (functional1 is Functional1Three) {
      return three != null ? three(functional1.x) : orElse(functional1);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(int Function(double) x)? one,
    void Function(int Function(double)? x)? two,
    void Function(int Function(double)? x)? three,
    void Function(Functional1 functional1)? orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      if (one != null) {
        one(functional1.x);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else if (functional1 is Functional1Two) {
      if (two != null) {
        two(functional1.x);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else if (functional1 is Functional1Three) {
      if (three != null) {
        three(functional1.x);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(int Function(double) x)? one,
    R Function(int Function(double)? x)? two,
    R Function(int Function(double)? x)? three,
    R Function(Functional1 functional1)? orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one != null ? one(functional1.x) : orElse?.call(functional1);
    } else if (functional1 is Functional1Two) {
      return two != null ? two(functional1.x) : orElse?.call(functional1);
    } else if (functional1 is Functional1Three) {
      return three != null ? three(functional1.x) : orElse?.call(functional1);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(Functional1One one) one,
    required R Function(Functional1Two two) two,
    required R Function(Functional1Three three) three,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one(functional1);
    } else if (functional1 is Functional1Two) {
      return two(functional1);
    } else if (functional1 is Functional1Three) {
      return three(functional1);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(Functional1One one)? one,
    R Function(Functional1Two two)? two,
    R Function(Functional1Three three)? three,
    required R Function(Functional1 functional1) orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one != null ? one(functional1) : orElse(functional1);
    } else if (functional1 is Functional1Two) {
      return two != null ? two(functional1) : orElse(functional1);
    } else if (functional1 is Functional1Three) {
      return three != null ? three(functional1) : orElse(functional1);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(Functional1One one)? one,
    void Function(Functional1Two two)? two,
    void Function(Functional1Three three)? three,
    void Function(Functional1 functional1)? orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      if (one != null) {
        one(functional1);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else if (functional1 is Functional1Two) {
      if (two != null) {
        two(functional1);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else if (functional1 is Functional1Three) {
      if (three != null) {
        three(functional1);
      } else if (orElse != null) {
        orElse(functional1);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(Functional1One one)? one,
    R Function(Functional1Two two)? two,
    R Function(Functional1Three three)? three,
    R Function(Functional1 functional1)? orElse,
  }) {
    final functional1 = this;
    if (functional1 is Functional1One) {
      return one != null ? one(functional1) : orElse?.call(functional1);
    } else if (functional1 is Functional1Two) {
      return two != null ? two(functional1) : orElse?.call(functional1);
    } else if (functional1 is Functional1Three) {
      return three != null ? three(functional1) : orElse?.call(functional1);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Functional1One] : [Functional1]) one){[int Function(double)] x}
///
/// with data equality
class Functional1One extends Functional1 with EquatableMixin {
  const Functional1One({
    required this.x,
  }) : super._internal();

  final int Function(double) x;

  @override
  String toString() => 'Functional1.one(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional1Two] : [Functional1]) two){[int Function(double)]? x}
///
/// with data equality
class Functional1Two extends Functional1 with EquatableMixin {
  const Functional1Two({
    this.x,
  }) : super._internal();

  final int Function(double)? x;

  @override
  String toString() => 'Functional1.two(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional1Three] : [Functional1]) three){[int Function(double)]? x}
///
/// with data equality
class Functional1Three extends Functional1 with EquatableMixin {
  const Functional1Three({
    this.x,
  }) : super._internal();

  final int Function(double)? x;

  @override
  String toString() => 'Functional1.three(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// [Functional2] {
///
/// ([Functional2One] one){[int Function(double)] x} with data equality
///
/// ([Functional2Two] two){[int Function(double)]? x} with data equality
///
/// }
@SealedManifest(_Functional2)
abstract class Functional2 {
  const Functional2._internal();

  const factory Functional2.one({
    required int Function(double) x,
  }) = Functional2One;

  const factory Functional2.two({
    int Function(double)? x,
  }) = Functional2Two;

  bool get isOne => this is Functional2One;

  bool get isTwo => this is Functional2Two;

  Functional2One get asOne => this as Functional2One;

  Functional2Two get asTwo => this as Functional2Two;

  Functional2One? get asOneOrNull {
    final functional2 = this;
    return functional2 is Functional2One ? functional2 : null;
  }

  Functional2Two? get asTwoOrNull {
    final functional2 = this;
    return functional2 is Functional2Two ? functional2 : null;
  }

  R when<R extends Object?>({
    required R Function(int Function(double) x) one,
    required R Function(int Function(double)? x) two,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one(functional2.x);
    } else if (functional2 is Functional2Two) {
      return two(functional2.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(int Function(double) x)? one,
    R Function(int Function(double)? x)? two,
    required R Function(Functional2 functional2) orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one != null ? one(functional2.x) : orElse(functional2);
    } else if (functional2 is Functional2Two) {
      return two != null ? two(functional2.x) : orElse(functional2);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(int Function(double) x)? one,
    void Function(int Function(double)? x)? two,
    void Function(Functional2 functional2)? orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      if (one != null) {
        one(functional2.x);
      } else if (orElse != null) {
        orElse(functional2);
      }
    } else if (functional2 is Functional2Two) {
      if (two != null) {
        two(functional2.x);
      } else if (orElse != null) {
        orElse(functional2);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(int Function(double) x)? one,
    R Function(int Function(double)? x)? two,
    R Function(Functional2 functional2)? orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one != null ? one(functional2.x) : orElse?.call(functional2);
    } else if (functional2 is Functional2Two) {
      return two != null ? two(functional2.x) : orElse?.call(functional2);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(Functional2One one) one,
    required R Function(Functional2Two two) two,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one(functional2);
    } else if (functional2 is Functional2Two) {
      return two(functional2);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(Functional2One one)? one,
    R Function(Functional2Two two)? two,
    required R Function(Functional2 functional2) orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one != null ? one(functional2) : orElse(functional2);
    } else if (functional2 is Functional2Two) {
      return two != null ? two(functional2) : orElse(functional2);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(Functional2One one)? one,
    void Function(Functional2Two two)? two,
    void Function(Functional2 functional2)? orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      if (one != null) {
        one(functional2);
      } else if (orElse != null) {
        orElse(functional2);
      }
    } else if (functional2 is Functional2Two) {
      if (two != null) {
        two(functional2);
      } else if (orElse != null) {
        orElse(functional2);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(Functional2One one)? one,
    R Function(Functional2Two two)? two,
    R Function(Functional2 functional2)? orElse,
  }) {
    final functional2 = this;
    if (functional2 is Functional2One) {
      return one != null ? one(functional2) : orElse?.call(functional2);
    } else if (functional2 is Functional2Two) {
      return two != null ? two(functional2) : orElse?.call(functional2);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Functional2One] : [Functional2]) one){[int Function(double)] x}
///
/// with data equality
class Functional2One extends Functional2 with EquatableMixin {
  const Functional2One({
    required this.x,
  }) : super._internal();

  final int Function(double) x;

  @override
  String toString() => 'Functional2.one(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional2Two] : [Functional2]) two){[int Function(double)]? x}
///
/// with data equality
class Functional2Two extends Functional2 with EquatableMixin {
  const Functional2Two({
    this.x,
  }) : super._internal();

  final int Function(double)? x;

  @override
  String toString() => 'Functional2.two(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// [Functional3] {
///
/// ([Functional3One] one){[Func] x} with data equality
///
/// ([Functional3Two] two){[Func]? x} with data equality
///
/// ([Functional3Three] three){[FuncN] x} with data equality
///
/// ([Functional3Four] four){[int Function(double x)] x} with data equality
///
/// ([Functional3Five] five){[int Function(double x)]? x} with data equality
///
/// }
@SealedManifest(_Functional3)
abstract class Functional3 {
  const Functional3._internal();

  const factory Functional3.one({
    required Func x,
  }) = Functional3One;

  const factory Functional3.two({
    Func? x,
  }) = Functional3Two;

  const factory Functional3.three({
    required FuncN x,
  }) = Functional3Three;

  const factory Functional3.four({
    required int Function(double x) x,
  }) = Functional3Four;

  const factory Functional3.five({
    int Function(double x)? x,
  }) = Functional3Five;

  bool get isOne => this is Functional3One;

  bool get isTwo => this is Functional3Two;

  bool get isThree => this is Functional3Three;

  bool get isFour => this is Functional3Four;

  bool get isFive => this is Functional3Five;

  Functional3One get asOne => this as Functional3One;

  Functional3Two get asTwo => this as Functional3Two;

  Functional3Three get asThree => this as Functional3Three;

  Functional3Four get asFour => this as Functional3Four;

  Functional3Five get asFive => this as Functional3Five;

  Functional3One? get asOneOrNull {
    final functional3 = this;
    return functional3 is Functional3One ? functional3 : null;
  }

  Functional3Two? get asTwoOrNull {
    final functional3 = this;
    return functional3 is Functional3Two ? functional3 : null;
  }

  Functional3Three? get asThreeOrNull {
    final functional3 = this;
    return functional3 is Functional3Three ? functional3 : null;
  }

  Functional3Four? get asFourOrNull {
    final functional3 = this;
    return functional3 is Functional3Four ? functional3 : null;
  }

  Functional3Five? get asFiveOrNull {
    final functional3 = this;
    return functional3 is Functional3Five ? functional3 : null;
  }

  R when<R extends Object?>({
    required R Function(Func x) one,
    required R Function(Func? x) two,
    required R Function(FuncN x) three,
    required R Function(int Function(double x) x) four,
    required R Function(int Function(double x)? x) five,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one(functional3.x);
    } else if (functional3 is Functional3Two) {
      return two(functional3.x);
    } else if (functional3 is Functional3Three) {
      return three(functional3.x);
    } else if (functional3 is Functional3Four) {
      return four(functional3.x);
    } else if (functional3 is Functional3Five) {
      return five(functional3.x);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Func x)? one,
    R Function(Func? x)? two,
    R Function(FuncN x)? three,
    R Function(int Function(double x) x)? four,
    R Function(int Function(double x)? x)? five,
    required R Function(Functional3 functional3) orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one != null ? one(functional3.x) : orElse(functional3);
    } else if (functional3 is Functional3Two) {
      return two != null ? two(functional3.x) : orElse(functional3);
    } else if (functional3 is Functional3Three) {
      return three != null ? three(functional3.x) : orElse(functional3);
    } else if (functional3 is Functional3Four) {
      return four != null ? four(functional3.x) : orElse(functional3);
    } else if (functional3 is Functional3Five) {
      return five != null ? five(functional3.x) : orElse(functional3);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Func x)? one,
    void Function(Func? x)? two,
    void Function(FuncN x)? three,
    void Function(int Function(double x) x)? four,
    void Function(int Function(double x)? x)? five,
    void Function(Functional3 functional3)? orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      if (one != null) {
        one(functional3.x);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Two) {
      if (two != null) {
        two(functional3.x);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Three) {
      if (three != null) {
        three(functional3.x);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Four) {
      if (four != null) {
        four(functional3.x);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Five) {
      if (five != null) {
        five(functional3.x);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Func x)? one,
    R Function(Func? x)? two,
    R Function(FuncN x)? three,
    R Function(int Function(double x) x)? four,
    R Function(int Function(double x)? x)? five,
    R Function(Functional3 functional3)? orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one != null ? one(functional3.x) : orElse?.call(functional3);
    } else if (functional3 is Functional3Two) {
      return two != null ? two(functional3.x) : orElse?.call(functional3);
    } else if (functional3 is Functional3Three) {
      return three != null ? three(functional3.x) : orElse?.call(functional3);
    } else if (functional3 is Functional3Four) {
      return four != null ? four(functional3.x) : orElse?.call(functional3);
    } else if (functional3 is Functional3Five) {
      return five != null ? five(functional3.x) : orElse?.call(functional3);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(Functional3One one) one,
    required R Function(Functional3Two two) two,
    required R Function(Functional3Three three) three,
    required R Function(Functional3Four four) four,
    required R Function(Functional3Five five) five,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one(functional3);
    } else if (functional3 is Functional3Two) {
      return two(functional3);
    } else if (functional3 is Functional3Three) {
      return three(functional3);
    } else if (functional3 is Functional3Four) {
      return four(functional3);
    } else if (functional3 is Functional3Five) {
      return five(functional3);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(Functional3One one)? one,
    R Function(Functional3Two two)? two,
    R Function(Functional3Three three)? three,
    R Function(Functional3Four four)? four,
    R Function(Functional3Five five)? five,
    required R Function(Functional3 functional3) orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one != null ? one(functional3) : orElse(functional3);
    } else if (functional3 is Functional3Two) {
      return two != null ? two(functional3) : orElse(functional3);
    } else if (functional3 is Functional3Three) {
      return three != null ? three(functional3) : orElse(functional3);
    } else if (functional3 is Functional3Four) {
      return four != null ? four(functional3) : orElse(functional3);
    } else if (functional3 is Functional3Five) {
      return five != null ? five(functional3) : orElse(functional3);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(Functional3One one)? one,
    void Function(Functional3Two two)? two,
    void Function(Functional3Three three)? three,
    void Function(Functional3Four four)? four,
    void Function(Functional3Five five)? five,
    void Function(Functional3 functional3)? orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      if (one != null) {
        one(functional3);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Two) {
      if (two != null) {
        two(functional3);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Three) {
      if (three != null) {
        three(functional3);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Four) {
      if (four != null) {
        four(functional3);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else if (functional3 is Functional3Five) {
      if (five != null) {
        five(functional3);
      } else if (orElse != null) {
        orElse(functional3);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(Functional3One one)? one,
    R Function(Functional3Two two)? two,
    R Function(Functional3Three three)? three,
    R Function(Functional3Four four)? four,
    R Function(Functional3Five five)? five,
    R Function(Functional3 functional3)? orElse,
  }) {
    final functional3 = this;
    if (functional3 is Functional3One) {
      return one != null ? one(functional3) : orElse?.call(functional3);
    } else if (functional3 is Functional3Two) {
      return two != null ? two(functional3) : orElse?.call(functional3);
    } else if (functional3 is Functional3Three) {
      return three != null ? three(functional3) : orElse?.call(functional3);
    } else if (functional3 is Functional3Four) {
      return four != null ? four(functional3) : orElse?.call(functional3);
    } else if (functional3 is Functional3Five) {
      return five != null ? five(functional3) : orElse?.call(functional3);
    } else {
      throw AssertionError();
    }
  }
}

/// (([Functional3One] : [Functional3]) one){[Func] x}
///
/// with data equality
class Functional3One extends Functional3 with EquatableMixin {
  const Functional3One({
    required this.x,
  }) : super._internal();

  final Func x;

  @override
  String toString() => 'Functional3.one(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional3Two] : [Functional3]) two){[Func]? x}
///
/// with data equality
class Functional3Two extends Functional3 with EquatableMixin {
  const Functional3Two({
    this.x,
  }) : super._internal();

  final Func? x;

  @override
  String toString() => 'Functional3.two(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional3Three] : [Functional3]) three){[FuncN] x}
///
/// with data equality
class Functional3Three extends Functional3 with EquatableMixin {
  const Functional3Three({
    required this.x,
  }) : super._internal();

  final FuncN x;

  @override
  String toString() => 'Functional3.three(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional3Four] : [Functional3]) four){[int Function(double x)] x}
///
/// with data equality
class Functional3Four extends Functional3 with EquatableMixin {
  const Functional3Four({
    required this.x,
  }) : super._internal();

  final int Function(double x) x;

  @override
  String toString() => 'Functional3.four(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}

/// (([Functional3Five] : [Functional3]) five){[int Function(double x)]? x}
///
/// with data equality
class Functional3Five extends Functional3 with EquatableMixin {
  const Functional3Five({
    this.x,
  }) : super._internal();

  final int Function(double x)? x;

  @override
  String toString() => 'Functional3.five(x: $x)';

  @override
  List<Object?> get props => [
        x,
      ];
}
