import 'package:test/test.dart';

import '../../bin/nullsafe/weather.dart';

void main() {
  group('class Weather', () {
    test('initialization', () {
      final w1 = Windy(velocity: 1.5, angle: null);
      expect(w1.velocity, equals(1.5));
      expect(w1.angle, isNull);

      final w2 = Windy(velocity: 1.5, angle: 50);
      expect(w2.velocity, equals(1.5));
      expect(w2.angle, equals(50));
    });

    test('equality', () {
      final r1 = Rainy(rain: 0);
      final r2 = Rainy(rain: 0);
      final r3 = Rainy(rain: 10);

      expect(r1, equals(r1));
      expect(r2, equals(r1));
      expect(r3, isNot(equals(r1)));
    });
  });
}
