import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/sub/sub_doc_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubDocWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubDocWriter(source);

      expect(writer.source, source);
    });

    group('method write', () {
      test('data equality', () {
        final source = source1DataSafe;
        final writer = SubDocWriter(source);
        final item2 = source.manifest.items[1];
        final item3 = source.manifest.items[2];

        expect(
          writer.write(item2),
          '/// (([WeatherRainy] : [Weather]) rainy){[int] rain}\n'
          '/// \n'
          '/// with data equality',
        );
        expect(
          writer.write(item3),
          '/// (([HelloWindy] : [Weather]) windy)'
          '{[double] velocity, [double]? angle}\n'
          '/// \n'
          '/// with data equality',
        );
      });

      test('identity equality', () {
        final source = source1IdentitySafe;
        final writer = SubDocWriter(source);
        final item2 = source.manifest.items[1];

        expect(
          writer.write(item2),
          '/// (([WeatherRainy] : [Weather]) rainy){[int] rain}\n'
          '/// \n'
          '/// with identity equality',
        );
      });

      test('distinct equality', () {
        final source = source1DistinctSafe;
        final writer = SubDocWriter(source);
        final item2 = source.manifest.items[1];

        expect(
          writer.write(item2),
          '/// (([WeatherRainy] : [Weather]) rainy){[int] rain}\n'
          '/// \n'
          '/// with distinct equality',
        );
      });

      test('data equality generic', () {
        final source = source2DataSafe;
        final writer = SubDocWriter(source);
        final item1 = source.manifest.items[0];

        expect(
          writer.write(item1),
          '/// (([MySuccess] : [Result])<[T] extends [num]> success)'
          '{[T] data}\n'
          '/// \n'
          '/// with data equality',
        );
      });
    });

    test('constant equalityNames', () {
      // should have same order
      expect(
        SubDocWriter.equalityNames.map((e) => 'ManifestEquality.$e').toList(),
        ManifestEquality.values.map((e) => '$e').toList(),
      );
    });
  });
}
