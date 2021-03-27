import 'package:sealed_generator/sealed_generator.dart';
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
