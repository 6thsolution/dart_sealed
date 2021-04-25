import 'package:test/test.dart';

import '../../../../../bin/sealed/nullsafe/distinct/simple/weather.dart';

void main() {
  group('class Weather', () {
    test('initialization', () {
      final w1 = Weather.windy(velocity: 1.5, angle: null);
      expect(w1.velocity, equals(1.5));
      expect(w1.angle, isNull);

      final w2 = Weather.windy(velocity: 1.5, angle: 50);
      expect(w2.velocity, equals(1.5));
      expect(w2.angle, equals(50));
    });

    test('equality', () {
      final r1 = Weather.rainy(rain: 0);
      final r2 = Weather.rainy(rain: 0);
      final r3 = r1.copy();
      final r4 = Weather.rainy(rain: 10);

      expect(r1, isNot(equals(r1)));
      expect(r2, isNot(equals(r1)));
      expect(r3, isNot(equals(r1)));
      expect(r4, isNot(equals(r1)));
    });
  });
}
