extension NameUtils on String {
  bool startWithUpper() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    return first == first.toUpperCase();
  }

  bool startWithLower() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    return first == first.toLowerCase();
  }

  String toUpperStart() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final second = substring(1);
    return first.toUpperCase() + second;
  }

  String toLowerStart() {
    assert(isNotEmpty && trim() == this);
    final first = substring(0, 1);
    assert(first != '_');
    final second = substring(1);
    return first.toLowerCase() + second;
  }
}
