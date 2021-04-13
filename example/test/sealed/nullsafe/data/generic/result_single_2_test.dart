import 'package:test/test.dart';

import '../../../../../bin/sealed/nullsafe/data/generic/result_single_2.dart';
import '../../../../utils/type_utils.dart';

void main() {
  group('nullsafe data generic result single 2', () {
    test('initialization', () {
      final a = Result.error(exception: 12);
      expect(a.exception, equals(12));
      expect(a, hasType<ResultError<num?>>());

      final b = Result.success(data: 1.5);
      expect(b.data, equals(1.5));
      expect(b, hasType<ResultSuccess<double>>());

      final c = Result.success(data: 1);
      expect(c.data, equals(1));
      expect(c, hasType<ResultSuccess<int>>());

      final d = Result.success(data: null);
      expect(d.data, isNull);
      expect(d, hasType<ResultSuccess<Null>>());
    });

    test('equality', () {
      final a = Result.success(data: 1);
      final b = Result.success(data: 1);
      final c = Result.success(data: 2);
      final d = Result.success(data: 0.75);
      final e = Result.success(data: null);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
      expect(a, isNot(equals(e)));
    });
  });
}
