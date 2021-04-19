/// utilities for string iterables
extension StringIterableUtils on Iterable<String> {
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

  /// add ', ' between and a trailing ',' if not empty
  String joinArgsFull() {
    if (isEmpty) {
      return '';
    } else {
      return join(', ') + ',';
    }
  }

  /// add '\n\n' between
  String joinMethods() => join('\n\n');

  /// add '\n' between
  String joinLines() => join('\n');

  /// join simply
  String joinParts() => join();

  /// add '// '
  Iterable<String> addComments() => map((str) => str.addComment());

  /// add '/// '
  Iterable<String> addDocComments() => map((str) => str.addDocComment());

  /// add empty lines between
  Iterable<String> insertEmptyLinesBetween() =>
      expand((str) => [str, ''])._removeLast();

  Iterable<String> _removeLast() => isNotEmpty ? take(length - 1) : this;
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

  /// add <> or not if empty
  String withLtGtOrNot() => trim().isEmpty ? '' : withLtGt();

  /// add '// '
  String addComment() => '// $this';

  /// add '/// '
  String addDocComment() => '/// $this';

  /// add []
  String withBraKet() => '[$this]';
}
