import 'package:sealed_writer/src/writer/sub/sub_equatable_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubEquatableWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubEquatableWriter(source);

      expect(writer.source, source);
    });

    test('method subEquatableFieldNames', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final field1 = item3.fields[0];
      final writer = SubEquatableWriter(source);

      expect(writer.fieldName(field1), 'velocity');
    });

    test('method subEquatableFieldNames', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final writer = SubEquatableWriter(source);

      expect(
        writer.subEquatableFieldNames(item3),
        item3.fields.map((e) => e.name),
      );
    });

    group('method subEquatableEquality', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          // void windy(double velocity, double? angle);
          final item3 = source.manifest.items[2];
          final writer = SubEquatableWriter(source);

          expect(
            writer.subEquatableEquality(item3),
            '@override\n'
            'List<Object?> get props => [velocity, angle,];',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          // void windy(double velocity, double? angle);
          final item3 = source.manifest.items[2];
          final writer = SubEquatableWriter(source);

          expect(
            writer.subEquatableEquality(item3),
            '@override\n'
            'List<Object/*?*/>/*!*/ get props => [velocity, angle,];',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item1 = source.manifest.items[0];
          final writer = SubEquatableWriter(source);

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
