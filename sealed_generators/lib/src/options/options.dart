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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Options &&
          runtimeType == other.runtimeType &&
          isNullSafe == other.isNullSafe;

  @override
  int get hashCode => runtimeType.hashCode ^ isNullSafe.hashCode;
}
