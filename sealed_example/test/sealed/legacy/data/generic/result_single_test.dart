// @dart=2.9
import 'package:test/test.dart';

import '../../../../../bin/sealed/legacy/data/generic/result_single.dart';
import '../../../../utils/type_utils.dart';

void main() {
  group('class Result', () {
    test('initialization', () {
      final a = ResultError(exception: 12);
      expect(a.exception, equals(12));
      expect(a, hasType<ResultError<num>>());

      final b = Result.success(data: 1.5).asSuccess();
      expect(b.data, equals(1.5));
      expect(b, hasType<ResultSuccess<double>>());

      final c = ResultSuccess(data: 1);
      expect(c.data, equals(1));
      expect(c, hasType<ResultSuccess<int>>());
    });

    test('equality', () {
      final a = ResultSuccess(data: 1);
      final b = ResultSuccess(data: 1);
      final c = ResultSuccess(data: 2);
      final d = ResultSuccess(data: 0.75);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });
  });
}
