/// utilities for joining strings
extension JoinUtils on Iterable<String> {
  String joinArgs() {
    if (isEmpty) {
      return '';
    } else if (length == 1) {
      return first;
    } else {
      return join(', ') + ',';
    }
  }
}
