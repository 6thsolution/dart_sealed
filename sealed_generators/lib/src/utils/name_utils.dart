/// utilities for type and variable names
///
/// should not start with "_".
extension NameUtils on String {
  /// should not start with "_".
  bool startsWithUpper() {
    assert(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    assert(first != '_');
    final upperFirst = first.toUpperCase();
    return first == upperFirst;
  }

  /// should not start with "_".
  bool startsWithLower() {
    assert(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    assert(first != '_');
    final lowerFirst = first.toLowerCase();
    return first == lowerFirst;
  }

  /// should not start with "_".
  String toUpperStart() {
    assert(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    assert(first != '_');
    final upperFirst = first.toUpperCase();
    assert(upperFirst != first);
    final second = substring(1);
    return upperFirst + second;
  }

  /// should not start with "_".
  String toLowerStart() {
    assert(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    assert(first != '_');
    final lowerFirst = first.toLowerCase();
    assert(lowerFirst != first);
    final second = substring(1);
    return lowerFirst + second;
  }
}
