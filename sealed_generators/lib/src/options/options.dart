import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

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
