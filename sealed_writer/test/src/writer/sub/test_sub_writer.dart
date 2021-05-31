import 'package:sealed_writer/src/writer/sub/sub_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SubWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SubWriter(source);

      expect(writer.source, source);
    });

    test('method hasNullable', () {
      final source = source1DataSafe;
      // void sunny();
      final manifest = source.manifest;
      final item1 = manifest.items[0];
      // void rainy(int rain);
      final item2 = manifest.items[1];
      // void windy(double velocity, double? angle);
      final item3 = manifest.items[2];
      final writer = SubWriter(source);

      expect(writer.hasNullable(item1), false);
      expect(writer.hasNullable(item2), false);
      expect(writer.hasNullable(item3), true);
    });

    group('method subClassStart', () {
      group('simple', () {
        test('equality data', () {
          final source = source1DataSafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClassStart(item2),
            stringContainsInOrder([
              writer.subDocWriter.write(item2),
              'class WeatherRainy extends Weather with EquatableMixin',
            ]),
          );
        });

        test('equality identity', () {
          final source = source1IdentitySafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClassStart(item2),
            stringContainsInOrder([
              writer.subDocWriter.write(item2),
              'class WeatherRainy extends Weather',
            ]),
          );
        });

        test('equality distinct', () {
          final source = source1DistinctSafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClassStart(item2),
            stringContainsInOrder([
              writer.subDocWriter.write(item2),
              'class WeatherRainy extends Weather',
            ]),
          );
        });
      });

      group('generic', () {
        test('equality data', () {
          final source = source2DataSafe;
          final item1 = source.manifest.items[0];
          final writer = SubWriter(source);

          expect(
            writer.subClassStart(item1),
            stringContainsInOrder([
              writer.subDocWriter.write(item1),
              'class MySuccess<T extends num>'
                  ' extends Result<T> with EquatableMixin',
            ]),
          );
        });
      });
    });

    group('method topDistinctEquality', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final writer = SubWriter(source);

          expect(
            writer.subDistinctEquality(),
            '@override\n'
            'bool operator ==(Object other) => false;',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final writer = SubWriter(source);

          expect(
            writer.subDistinctEquality(),
            '@override\n'
            'bool/*!*/ operator ==(Object other) => false;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final writer = SubWriter(source);

          expect(
            writer.subDistinctEquality(),
            '@override\n'
            'bool operator ==(Object other) => false;',
          );
        });
      });
    });

    group('method subClass', () {
      group('simple', () {
        test('equality data', () {
          final source = source1DataSafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item2),
            allOf(
              endsWith('}'),
              stringContainsInOrder([
                writer.subDocWriter.write(item2),
                'class WeatherRainy extends Weather with EquatableMixin',
                '{',
                'const WeatherRainy({required this.rain,}): super._internal();',
                'final int rain;',
                'WeatherRainy copy(',
                'String toString(',
                'get props'
              ]),
            ),
          );
        });

        test('equality data generic', () {
          final source = source2DataSafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item2),
            isNot(stringContainsInOrder(['copy'])),
          );
        });

        test('equality data with nullable', () {
          final source = source1DataSafe;
          // void windy(double velocity, double? angle);
          final item3 = source.manifest.items[2];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item3),
            isNot(stringContainsInOrder(['copy('])),
          );
        });

        test('equality identity', () {
          final source = source1IdentitySafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item2),
            allOf(
              isNot(stringContainsInOrder(['get props'])),
              isNot(stringContainsInOrder(['EquatableMixin'])),
            ),
          );
        });

        test('equality distinct', () {
          final source = source1DistinctSafe;
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item2),
            allOf(
              stringContainsInOrder(['operator ==']),
              isNot(stringContainsInOrder(['get props'])),
              isNot(stringContainsInOrder(['EquatableMixin'])),
            ),
          );
        });
      });

      group('generic', () {
        test('equality data', () {
          final source = source2DataSafe;
          final item1 = source.manifest.items[0];
          final writer = SubWriter(source);

          expect(
            writer.subClass(item1),
            allOf(
              endsWith('}'),
              stringContainsInOrder([
                writer.subDocWriter.write(item1),
                'class MySuccess<T extends num>'
                    ' extends Result<T> with EquatableMixin',
                '{',
                'const MySuccess({required this.data,})'
                    ': super._internal();',
                'final T data;',
                'String toString(',
                'get props'
              ]),
              isNot(stringContainsInOrder(['copy'])),
            ),
          );
        });
      });
    });

    test('method subClasses', () {
      final source = source1DataSafe;
      final manifest = source.manifest;
      final writer = SubWriter(source);

      expect(
        writer.subClasses(),
        containsAllInOrder(
          manifest.items.map(writer.subClass).toList(),
        ),
      );
    });
    // end of group SubWriter
  });
}
