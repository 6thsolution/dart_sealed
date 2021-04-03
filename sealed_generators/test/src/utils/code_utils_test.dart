import 'package:test/test.dart';

import '../../utils/code_utils.dart';

void main() {
  group('extension CodeUtils', () {
    test('method tr', () {
      expect(' abc \n  de\n'.tr(), 'abc de');
      expect('\n\n  abc  de '.tr(), 'abc de');
      expect(' abc \n\n  \n de '.tr(), 'abc de');
    });
  });
}
