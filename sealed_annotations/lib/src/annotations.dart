import 'package:equatable/equatable.dart';
import 'package:meta/meta_meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

@sealed
@Target({TargetKind.classType})
class Sealed {
  final SealedEquality equality;

  const Sealed({
    this.equality = SealedEquality.data,
  });

  @override
  String toString() => 'Sealed(equality: $equality)';
}

@sealed
@Target({TargetKind.classType})
class SealedFrom {
  final Type type;

  const SealedFrom(this.type);

  @override
  String toString() => 'SealedFrom(type: $type)';
}

enum SealedEquality {
  data,
  identity,
  distinct,
}

abstract class SealedEqualityData extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class SealedEqualityIdentity {
  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => identityHashCode(this);
}

abstract class SealedEqualityDistinct {
  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => identityHashCode(this);
}
