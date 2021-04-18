import 'package:meta/meta.dart';

/// options
@immutable
@sealed
class Options {
  const Options({
    required this.isNullSafe,
  });

  final bool isNullSafe;

  @override
  String toString() => 'Options{isNullSafe: $isNullSafe}';
}
