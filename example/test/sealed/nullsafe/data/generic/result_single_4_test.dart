import 'package:test/test.dart';

import '../../../../../bin/sealed/nullsafe/data/generic/result_single_4.dart';
import '../../../../utils/type_utils.dart';

void main() {
  group('class Result', () {
    test('initialization', () {
      final a = ResultError(exception: 12);
      expect(a.exception, equals(12));
      expect(a, hasType<ResultError<num?>>());

      final b = Result.success(data: 1.5);
      expect(b.asSuccess.data, equals(1.5));
      expect(b, hasType<ResultSuccess<double>>());

      final c = ResultSuccess(data: 1);
      expect(c.data, equals(1));
      expect(c, hasType<ResultSuccess<int>>());

      final d = ResultSuccess(data: null);
      expect(d.data, isNull);
      // ignore: prefer_void_to_null
      expect(d, hasType<ResultSuccess<Null>>());
    });

    test('equality', () {
      final a = ResultSuccess(data: 1);
      final b = ResultSuccess(data: 1);
      final c = ResultSuccess(data: 2);
      final d = ResultSuccess(data: 0.75);
      final e = ResultSuccess(data: null);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
      expect(a, isNot(equals(e)));
    });
  });
}
