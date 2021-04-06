import 'package:sealed_generators/src/source/writer/doc/doc_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class DocWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = DocWriter(source);

      expect(writer.source, source);
    });

    group('method write', () {
      test('data equality', () {
        final source = source1DataSafe;
        final writer = DocWriter(source);

        expect(
          writer.write(),
          '/// Weather {\n'
          '/// \n'
          '/// Sunny()\n'
          '/// \n'
          '/// Rainy(int rain)\n'
          '/// \n'
          '/// Windy(double velocity, double? angle)\n'
          '/// \n'
          '/// }\n'
          '/// \n'
          '/// with data equality.',
        );
      });

      test('identity equality', () {
        final source = source1IdentitySafe;
        final writer = DocWriter(source);

        expect(
          writer.write(),
          stringContainsInOrder(['with identity equality.']),
        );
      });

      test('distinct equality', () {
        final source = source1DistinctSafe;
        final writer = DocWriter(source);

        expect(
          writer.write(),
          stringContainsInOrder(['with distinct equality.']),
        );
      });
    });
  });
}
