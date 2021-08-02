import 'package:sealed_writer/src/writer/sub/sub_equatable_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubEquatableWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SubEquatableWriter(manifest);

      expect(writer.manifest, manifest);
    });

    test('method subEquatableFieldNames', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final field1 = item3.fields[0];
      final writer = SubEquatableWriter(manifest);

      expect(writer.fieldName(field1), 'velocity');
    });

    test('method subEquatableFieldNames', () {
      final manifest = manifest1Data;
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubEquatableWriter(manifest);

      expect(
        writer.subEquatableFieldNames(item3),
        item3.fields.map((e) => e.name),
      );
    });

    group('method subEquatableEquality', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          // void windy(double velocity, double? angle);
          final item3 = manifest.items[2];
          final writer = SubEquatableWriter(manifest);

          expect(
            writer.subEquatableEquality(item3),
            '@override\n'
            'List<Object?> get props => [velocity, angle,];',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item1 = manifest.items[0];
          final writer = SubEquatableWriter(manifest);

          expect(
            writer.subEquatableEquality(item1),
            '@override\n'
            'List<Object?> get props => [data,];',
          );
        });
      });
    });
    // end of group SubEquatableWriter
  });
}
