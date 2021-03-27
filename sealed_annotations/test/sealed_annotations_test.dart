import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('tests', () {
    test('sealed equality data', () {
      final a = _SEData(10);
      final b = _SEData(10);
      final c = _SEData(20);

      // equatable
      expect(a, isA<Equatable>());

      // equals self
      expect(a, equals(a));
      expect(b, equals(b));
      expect(c, equals(c));

      // equals cross
      expect(a, equals(b));
      expect(b, equals(a));
      expect(a, isNot(equals(c)));
      expect(c, isNot(equals(a)));
      expect(b, isNot(equals(c)));
      expect(c, isNot(equals(b)));

      // hashCode self
      expect(a.hashCode, equals(a.hashCode));

      // hashCode cross
      expect(a.hashCode, equals(b.hashCode));
      // for simple int should be different:
      expect(a.hashCode, isNot(equals(c.hashCode)));
    });
  });
}

class _SEData extends SealedEqualityData {
  final int x;

  _SEData(this.x);

  @override
  List<Object?> get props => [x];
}
