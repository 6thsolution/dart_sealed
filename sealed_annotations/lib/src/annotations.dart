import 'package:equatable/equatable.dart';

class Sealed {
  final SealedEquality equality;

  const Sealed({
    this.equality = SealedEquality.data,
  });
}

enum SealedEquality {
  data,
  identity,
  distinct,
}

@SealedEquality.data
abstract class SealedEqualityData extends Equatable {
  @override
  List<Object?> get props;

  @override
  String toString();
}

@SealedEquality.identity
abstract class SealedEqualityIdentity {
  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}

@SealedEquality.distinct
abstract class SealedEqualityDistinct {
  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}
