import 'package:equatable/equatable.dart';

export 'package:equatable/equatable.dart';

class Sealed {
  final SealedEquality equality;

  const Sealed({
    this.equality = SealedEquality.data,
  });
}

class SealedFrom {
  final Type type;

  const SealedFrom(this.type);
}

enum SealedEquality {
  data,
  identity,
  distinct,
}

abstract class SealedEqualityData extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;

  @override
  String toString();
}

abstract class SealedEqualityIdentity {
  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}

abstract class SealedEqualityDistinct {
  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}
