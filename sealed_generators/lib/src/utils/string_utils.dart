/// utilities for string iterables
extension StringUtilsIterable on Iterable<String> {
  /// if more than one element add trailing ','
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

/// utilities for strings
extension StringUtils on String {
  /// add braces
  String withBraces() {
    return '{$this}';
  }

  /// add parenthesis
  String withParenthesis() {
    return '($this)';
  }
}
