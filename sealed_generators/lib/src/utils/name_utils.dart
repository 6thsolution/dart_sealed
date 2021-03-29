class NameUtils {
  NameUtils._() {
    throw 'internal';
  }

  static bool startWithUpper(String name) {
    assert(name.isNotEmpty && name.trim() == name);
    final first = name.substring(0, 1);
    assert(first != '_');
    return first == first.toUpperCase();
  }

  static bool startWithLower(String name) {
    assert(name.isNotEmpty && name.trim() == name);
    final first = name.substring(0, 1);
    assert(first != '_');
    return first == first.toLowerCase();
  }

  static String toUpperStart(String name) {
    assert(name.isNotEmpty && name.trim() == name);
    final first = name.substring(0, 1);
    assert(first != '_');
    final second = name.substring(1);
    return first.toUpperCase() + second;
  }

  static String toLowerStart(String name) {
    assert(name.isNotEmpty && name.trim() == name);
    final first = name.substring(0, 1);
    assert(first != '_');
    final second = name.substring(1);
    return first.toLowerCase() + second;
  }
}
