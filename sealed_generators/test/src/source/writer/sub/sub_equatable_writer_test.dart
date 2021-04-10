import 'package:sealed_generators/src/source/writer/sub/sub_equatable_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/code_utils.dart';
import '../../../../utils/examples.dart';

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

      expect(SubEquatableWriter.fieldName(field1), 'velocity');
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
      test('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SubEquatableWriter(source);

        expect(
          writer.subEquatableEquality(item3).tr(),
          '@override'
          'List<Object?> get props => [velocity, angle,];',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SubEquatableWriter(source);

        expect(
          writer.subEquatableEquality(item3).tr(),
          '@override'
          'List<Object/*?*/>/*!*/ get props => [velocity, angle,];',
        );
      });
    });
    // end of group SubEquatableWriter
  });
}
