import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('method check', () {
    test('when true does not throw', () {
      expect(() => check(true), isNot(throwsInternal()));
    });

    test('when false does throw', () {
      expect(() => check(false), throwsInternal());
    });
  });

  group('method require', () {
    group('with null argument', () {
      test('when true does not throw', () {
        expect(() => require(true), isNot(throwsInternal()));
      });

      test('when false does throw', () {
        expect(
          () => require(false),
          throwsA(allOf(
            isSealedError(),
            hasMessage(isNull),
            hasCause(isNull),
          )),
        );
      });
    });

    group('with String argument', () {
      test('when true does not throw', () {
        expect(() => require(true, 'msg'), isNot(throwsInternal()));
      });

      test('when false does throw', () {
        expect(
              () => require(false, 'msg'),
          throwsA(allOf(
            isSealedError(),
            hasMessage(equals('msg')),
            hasCause(isNull),
          )),
        );
      });
    });

    group('with String Function() argument', () {
      test('when true does not throw and not compute function', () {
        expect(
              () => require(true, () => throw 'should not happen!'),
          isNot(throwsInternal()),
        );
      });

      test('when false does throw and compute function', () {
        expect(
              () => require(false, () => 'm' * 2),
          throwsA(allOf(
            isSealedError(),
            hasMessage(equals('mm')),
            hasCause(isNull),
          )),
        );
      });
    });

    group('with other argument', () {
      test('when false does throw internal', () {
        expect(
              () => require(false, 1),
          throwsInternal(),
        );
      });
    });
  });

  group('class SealedException', () {
    test('initialization', () {
      expect(
        SealedError(),
        allOf(
          isSealedError(),
          hasMessage(isNull),
          hasCause(isNull),
        ),
      );

      expect(
        SealedError('msg'),
        allOf(
          isSealedError(),
          hasMessage(equals('msg')),
          hasCause(isNull),
        ),
      );

      expect(
        SealedError('msg', 1),
        allOf(
          isSealedError(),
          hasMessage(equals('msg')),
          hasCause(equals(1)),
        ),
      );
    });

    test('method toString', () {
      expect(
        SealedError().toString().toLowerCase(),
        allOf(
          contains('unknown'),
          isNot(contains('cause')),
        ),
      );

      expect(
        SealedError('msg').toString().toLowerCase(),
        allOf(
          contains('msg'),
          isNot(contains('cause')),
        ),
      );

      expect(
        SealedError('msg', 1).toString().toLowerCase(),
        allOf(
          contains('msg'),
          contains('cause'),
          contains('1'),
        ),
      );
    });
  });
}
