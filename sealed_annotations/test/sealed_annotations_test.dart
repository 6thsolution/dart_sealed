import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('tests', () {
    Sealed? sealed;

    setUp(() {
      sealed = Sealed();
    });

    test('equality', () {
      expect(sealed, sealed);
    });
  });
}
