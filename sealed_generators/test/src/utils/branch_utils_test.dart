import 'package:sealed_generators/src/utils/branch_utils.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('class If', () {
    test('initialization', () {
      final a = If(condition: 'cnd1', code: 'code1');

      expect(a.code, 'code1');
      expect(a.condition, 'cnd1');
    });
  });

  group('class Else', () {
    test('initialization', () {
      final a = Else(code: 'code3');

      expect(a.code, 'code3');
    });
  });

  group('class Branch', () {
    test('initialization', () {
      final a = If(condition: 'cnd1', code: 'code1');
      final e = Else(code: 'code3');
      final branch1 = Branch(ifs: [a], els: e);
      final branch2 = Branch(ifs: [a]);

      expect(branch1.ifs, contains(a));
      expect(branch1.els, e);
      expect(branch2.els, null);

      expect(() => Branch(ifs: []), throwsAssertion());
    });

    test('static method mapIf', () {
      final a = If(condition: 'cnd1', code: 'code1');
      expect(Branch.mapIf(a), 'if (cnd1) {code1}');
    });

    test('static method mapElseIf', () {
      final a = If(condition: 'cnd1', code: 'code1');
      expect(Branch.mapElseIf(a), 'else if (cnd1) {code1}');
    });

    test('static method mapElse', () {
      final e = Else(code: 'code3');
      expect(Branch.mapElse(e), 'else {code3}');
    });

    group('method join', () {
      final a = If(condition: 'cnd1', code: 'code1');
      final b = If(condition: 'cnd2', code: 'code2');
      final e = Else(code: 'code3');

      test('with 1 if and 0 else', () {
        final branch = Branch(ifs: [a]);
        expect(
          branch.join(),
          'if (cnd1) {code1}',
        );
      });

      test('with 2 if and 0 else', () {
        final branch = Branch(ifs: [a, b]);
        expect(
          branch.join(),
          'if (cnd1) {code1}\n'
          'else if (cnd2) {code2}',
        );
      });

      test('with 1 if and 1 else', () {
        final branch = Branch(ifs: [a], els: e);
        expect(
          branch.join(),
          'if (cnd1) {code1}\n'
          'else {code3}',
        );
      });

      test('with 2 if and 1 else', () {
        final branch = Branch(ifs: [a, b], els: e);
        expect(
          branch.join(),
          'if (cnd1) {code1}\n'
          'else if (cnd2) {code2}\n'
          'else {code3}',
        );
      });
    });
  });
}
