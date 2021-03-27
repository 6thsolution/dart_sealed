import 'package:sealed_generators/sealed_generators.dart';
import 'package:test/test.dart';

void main() {
  group('tests', () {
    Generator? generator;

    setUp(() {
      generator = Generator();
    });

    test('equality', () {
      expect(generator, generator);
    });
  });
}
