import 'package:matcher/src/feature_matcher.dart';
import 'package:test/test.dart';

/// removes whitespace for better comparison
extension CodeUtils on String {
  static final _spaces = RegExp('( )+');

  String tr() {
    return replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll(_spaces, ' ')
        .trim();
  }
}

/// match without order
///
/// can have conflict
Matcher stringContains(List<String> substrings) => _StringContains(substrings);

class _StringContains extends FeatureMatcher<String> {
  final List<String> _substrings;

  const _StringContains(this._substrings);

  @override
  bool typedMatches(String item, Map matchState) {
    for (final s in _substrings) {
      if (!item.contains(s)) return false;
    }
    return true;
  }

  @override
  Description describe(Description description) => description.addAll(
        'a string containing ',
        ', ',
        ' without order',
        _substrings,
      );
}
