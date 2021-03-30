import 'package:sealed_annotations/sealed_annotations.dart';

@immutable
@sealed
class Options {
  const Options({
    required this.equality,
    required this.isNullSafe,
  });

  final SealedEquality equality;
  final bool isNullSafe;

  @override
  String toString() => 'Options{equality: $equality, isNullSafe: $isNullSafe}';
}
