import 'package:equatable/equatable.dart';
import 'package:test/test.dart';

/// for [SealedEquality.data].
class _SEData with EquatableMixin {
  final int x;

  _SEData(this.x);

  @override
  List<Object?> get props => [x];
}

/// for [SealedEquality.identity].
class _SEIdentity {
  final int x;

  _SEIdentity(this.x);
}

/// for [SealedEquality.distinct].
class _SEDistinct {
  final int x;

  _SEDistinct(this.x);

  @override
  bool operator ==(Object other) => false;
}

void main() {
  group('sealed equality', () {
    test('sealed equality data', () {
      final a = _SEData(10);
      final b = _SEData(10);
      final c = _SEData(20);

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
