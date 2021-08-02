import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/sub/sub_doc_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubDocWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubDocWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method write', () {
      test('data equality', () {
        final manifest = manifest1Data;
        final writer = SubDocWriter(manifest);
        final item2 = manifest.items[1];
        final item3 = manifest.items[2];

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
        final manifest = manifest1Identity;
        final writer = SubDocWriter(manifest);
        final item2 = manifest.items[1];

        expect(
          writer.write(item2),
          '/// (([WeatherRainy] : [Weather]) rainy){[int] rain}\n'
          '/// \n'
          '/// with identity equality',
        );
      });

      test('distinct equality', () {
        final manifest = manifest1Distinct;
        final writer = SubDocWriter(manifest);
        final item2 = manifest.items[1];

        expect(
          writer.write(item2),
          '/// (([WeatherRainy] : [Weather]) rainy){[int] rain}\n'
          '/// \n'
          '/// with distinct equality',
        );
      });

      test('data equality generic', () {
        final manifest = manifest2Data;
        final writer = SubDocWriter(manifest);
        final item1 = manifest.items[0];

        expect(
          writer.write(item1),
          '/// (([MySuccess] : [Result])<[T] extends [num]> success)'
          '{[T] data}\n'
          '/// \n'
          '/// with data equality',
        );
      });

      test('data equality wrapped', () {
        final manifest = manifest3Data;
        final writer = SubDocWriter(manifest);
        final item3 = manifest.items[2];

        expect(
          writer.write(item3),
          '/// (([BaseThree] : [Base]) three)'
          '{[int] y, [int]? z}\n'
          '/// \n'
          '/// with data equality\n'
          '/// \n'
          '/// with wrap',
        );
      });

      test('data equality generic wrapped', () {
        final manifest = manifest4Data;
        final writer = SubDocWriter(manifest);
        final item1 = manifest.items[0];

        expect(
          writer.write(item1),
          '/// (([BaseOne] : [Base])<[T] extends [num]> one)'
          '{[T] x}\n'
          '/// \n'
          '/// with data equality\n'
          '/// \n'
          '/// with wrap',
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
