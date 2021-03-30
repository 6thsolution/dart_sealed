/// utilities for type and variable names
extension NameUtils on String {
  bool startWithUpper() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final upperFirst = first.toUpperCase();
    return first == upperFirst;
  }

  bool startWithLower() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final lowerFirst = first.toLowerCase();
    return first == lowerFirst;
  }

  String toUpperStart() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final upperFirst = first.toUpperCase();
    assert(upperFirst != first);
    final second = substring(1);
    return upperFirst + second;
  }

  String toLowerStart() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final lowerFirst = first.toLowerCase();
    assert(lowerFirst != first);
    final second = substring(1);
    return lowerFirst + second;
  }
}
