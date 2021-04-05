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

  /// add ', ' between
  String joinArgsSimple() => join(', ');

  /// add '\n\n' between
  String joinMethods() => join('\n\n');

  /// add '\n' between
  String joinLines() => join('\n');

  /// join simply
  String joinParts() => join();
}

/// utilities for strings
extension StringUtils on String {
  /// add braces
  String withBraces() => '{$this}';

  /// add braces or not if empty
  String withBracesOrNot() => trim().isEmpty ? '' : withBraces();

  /// add parenthesis
  String withParenthesis() => '($this)';

  /// add <>
  String withLtGt() => '<$this>';
}
