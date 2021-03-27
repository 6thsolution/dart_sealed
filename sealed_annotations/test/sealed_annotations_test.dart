import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('sealed annotations', () {
    test('annotation Sealed', () {
      final a = Sealed();
      expect(a.equality, SealedEquality.data);

      final b  = Sealed(equality: SealedEquality.identity);
      expect(b.equality, SealedEquality.identity);
    });

    test('annotation SealedFor', () {
      final a = SealedFrom(String);
      expect(a.type, String);
    });
  });

  group('sealed equality', () {
    test('sealed equality data', () {
      final a = _SEData(10);
      final b = _SEData(10);
      final c = _SEData(20);

      // equatable
      expect(a, isA<Equatable>());

      // self equality
      expect(a, equals(a));
      expect(b, equals(b));
      expect(c, equals(c));

      // cross equality
      expect(a, equals(b));
      expect(b, equals(a));
      expect(a, isNot(equals(c)));
      expect(c, isNot(equals(a)));
      expect(b, isNot(equals(c)));
      expect(c, isNot(equals(b)));

      // hashCode self compare
      expect(a.hashCode, equals(a.hashCode));

      // hashCode cross compare
      expect(a.hashCode, equals(b.hashCode));
      // for simple `int` should be different:
      expect(a.hashCode, isNot(equals(c.hashCode)));
    });

    test('sealed equality identity', () {
      final a = _SEIdentity(10);
      final b = _SEIdentity(10);
      final c = _SEIdentity(20);

      // not equatable
      expect(a, isNot(isA<Equatable>()));

      // self equality
      expect(a, equals(a));
      expect(b, equals(b));
      expect(c, equals(c));

      // cross equality
      expect(a, isNot(equals(b)));
      expect(b, isNot(equals(a)));
      expect(a, isNot(equals(c)));
      expect(c, isNot(equals(a)));
      expect(b, isNot(equals(c)));
      expect(c, isNot(equals(b)));

      // hashCode self compare
      expect(a.hashCode, equals(a.hashCode));

      // hashCode cross compare
      expect(a.hashCode, isNot(equals(b.hashCode)));
      expect(a.hashCode, isNot(equals(c.hashCode)));
    });

    test('sealed equality distinct', () {
      final a = _SEDistinct(10);
      final b = _SEDistinct(10);
      final c = _SEDistinct(20);

      // not equatable
      expect(a, isNot(isA<Equatable>()));

      // self equality
      expect(a, isNot(equals(a)));
      expect(b, isNot(equals(b)));
      expect(c, isNot(equals(c)));

      // cross equality
      expect(a, isNot(equals(b)));
      expect(b, isNot(equals(a)));
      expect(a, isNot(equals(c)));
      expect(c, isNot(equals(a)));
      expect(b, isNot(equals(c)));
      expect(c, isNot(equals(b)));

      // hashCode self compare
      expect(a.hashCode, equals(a.hashCode));

      // hashCode cross compare
      expect(a.hashCode, isNot(equals(b.hashCode)));
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

class _SEIdentity extends SealedEqualityIdentity {
  final int x;

  _SEIdentity(this.x);
}

class _SEDistinct extends SealedEqualityDistinct {
  final int x;

  _SEDistinct(this.x);
}
