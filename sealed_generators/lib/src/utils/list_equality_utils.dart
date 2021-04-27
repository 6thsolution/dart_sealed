/// checks equality through one level
bool listEquals<T extends Object>(List<T> list1, List<T> list2) {
  final length = list1.length;
  if (list2.length != length) return false;
  for (var index = 0; index < length; index++) {
    if (list1[index] != list2[index]) return false;
  }
  return true;
}

/// computes hash code through one level
int listHash<T extends Object>(List<T> list) {
  var hash = list.length;
  for (final e in list) {
    hash ^= e.hashCode;
  }
  return hash;
}
