import 'package:test/test.dart';

import 'code_utils.dart';

void main() {
  group('extension CodeUtils', () {
    test('method tr', () {
      expect('abc\nde'.tr(), 'abcde');
      expect(' abc \n  de\n'.tr(), 'abc de');
      expect('x\n\nabc\ny'.tr(), 'xabcy');
      expect('x\n \nabc'.tr(), 'x abc');
      expect('x \n  \n abc'.tr(), 'x abc');
      expect('\n\n  abc (     )  de '.tr(), 'abc ( ) de');
      expect('\n\n  abc (    ,\n )  de '.tr(), 'abc ( , ) de');
      expect('\n\n  abc (    ,\n s)  de '.tr(), 'abc ( , s) de');
      expect('\n\n  abc (x    ,\n s  )  de '.tr(), 'abc (x , s ) de');
      expect('\n\n  abc ( x    ,\n s)  de '.tr(), 'abc ( x , s) de');
      expect(' abc \n\n  \n de '.tr(), 'abc de');
    });
  });

  test('matcher stringContains', () {
    expect('abc de', stringContains(['abc', 'de']));
    expect('abc de', stringContains(['abc', 'bc de']));
    expect('abc de', stringContains(['abc', 'bc de', 'a']));
    expect('abc de', isNot(stringContains(['x'])));
  });
}
