import 'package:meta/meta.dart';

/// options
@immutable
@sealed
class Options {
  const Options({
    required this.equality,
    required this.isNullSafe,
  });

  final Equality equality;
  final bool isNullSafe;

  @override
  String toString() => 'Options{equality: $equality, isNullSafe: $isNullSafe}';
}

/// like [SealedEquality].
///
/// should be the same order.
enum Equality {
  data,
  identity,
  distinct,
}
