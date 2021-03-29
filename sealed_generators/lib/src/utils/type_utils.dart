extension TypeUtils on String {
  bool isNullable() {
    assert(isNotEmpty && trim() == this);
    return endsWith('?');
  }

  bool isNonNullable() {
    assert(isNotEmpty && trim() == this);
    return !endsWith('?');
  }

  String toLegacyNullable() {
    assert(isNotEmpty && trim() == this);
    assert(!endsWith('?'));
    return '$this /*?*/';
  }

  String toLegacyNonNullable() {
    assert(isNotEmpty && trim() == this);
    assert(!endsWith('?'));
    return '$this /*!*/';
  }
}
