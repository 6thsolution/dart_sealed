import 'package:test/test.dart';

import 'code_utils.dart';

void main() {
  test('matcher stringContains', () {
    expect('abc de', stringContains(['abc', 'de']));
    expect('abc de', stringContains(['abc', 'bc de']));
    expect('abc de', stringContains(['abc', 'bc de', 'a']));
    expect('abc de', isNot(stringContains(['x'])));
  });
}
