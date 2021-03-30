/// utilities for joining strings
extension JoinUtils on Iterable<String> {
  String joinArgs() {
    return join(', ');
  }
}
