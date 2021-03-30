import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:test/test.dart';

void main() {
  group('class Options', () {
    test('initialization', () {
      final options = Options(
        equality: SealedEquality.distinct,
        isNullSafe: false,
      );
      expect(options.equality, SealedEquality.distinct);
      expect(options.isNullSafe, false);
    });
  });
}
