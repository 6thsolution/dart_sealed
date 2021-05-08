/// utilities for lists
extension ListUtils<T extends Object?> on List<T> {
  /// check has one element.
  bool get isSingle => length == 1;

  /// check has one or zero element.
  bool get isSingleOrEmpty => length == 0 || length == 1;

  /// first element or null if empty.
  T? get firstOrNull => length == 0 ? null : this[0];
}
