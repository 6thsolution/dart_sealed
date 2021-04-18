import 'package:test/test.dart';

import '../../utils/examples.dart';

void main() {
  group('class Options', () {
    test('initialization', () {
      expect(optionsLegacy.isNullSafe, isFalse);
      expect(optionsSafe.isNullSafe, isTrue);
    });
  });
}
