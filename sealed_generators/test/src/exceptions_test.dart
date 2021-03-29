import 'package:sealed_generators/src/exceptions.dart';
import 'package:test/test.dart';

import '../utils/exception_utils.dart';

void main() {
  group('method require', () {
    test('when true does not throw', () {
      expect(() => require(true), isNot(throwsA(anything)));
      expect(() => require(true, 'msg'), isNot(throwsA(anything)));
    });

    test('when false does throw', () {
      expect(
        () => require(false),
        throwsA(allOf(
          isSealedException(),
          hasMessage(equals(null)),
          hasCause(equals(null)),
        )),
      );
      expect(
        () => require(false, 'msg'),
        throwsA(allOf(
          isSealedException(),
          hasMessage(equals('msg')),
          hasCause(equals(null)),
        )),
      );
    });
  });

  group('method requireLate', () {
    test('when true does not throw and not compute function', () {
      expect(
        () => requireLate(true, () => throw 'should not happen!'),
        isNot(throwsA(anything)),
      );
    });

    test('when false does throw and compute function', () {
      expect(
        () => requireLate(false, () => 'm' * 2),
        throwsA(allOf(
          isSealedException(),
          hasMessage(equals('mm')),
          hasCause(equals(null)),
        )),
      );
    });
  });

  group('class SealedException', () {
    test('initialization', () {
      expect(
        SealedException(),
        allOf(
          isSealedException(),
          hasMessage(equals(null)),
          hasCause(equals(null)),
        ),
      );

      expect(
        SealedException('msg'),
        allOf(
          isSealedException(),
          hasMessage(equals('msg')),
          hasCause(equals(null)),
        ),
      );

      expect(
        SealedException('msg', 1),
        allOf(
          isSealedException(),
          hasMessage(equals('msg')),
          hasCause(equals(1)),
        ),
      );
    });

    test('method toString', () {
      expect(
        SealedException().toString().toLowerCase(),
        allOf(
          contains('unknown'),
          isNot(contains('cause')),
        ),
      );

      expect(
        SealedException('msg').toString().toLowerCase(),
        allOf(
          contains('msg'),
          isNot(contains('cause')),
        ),
      );

      expect(
        SealedException('msg', 1).toString().toLowerCase(),
        allOf(
          contains('msg'),
          contains('cause'),
          contains('1'),
        ),
      );
    });
  });
}
