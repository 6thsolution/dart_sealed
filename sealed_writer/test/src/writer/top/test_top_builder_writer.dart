import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/top_builder_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class TopBuilderWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopBuilderWriter(source);

      expect(writer.source, source);
    });

    group('method subConstructorCallArg', () {
      test('simple', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = TopBuilderWriter(source);

        expect(
          writer.subConstructorCallArg(field1),
          'velocity: velocity',
        );
        expect(
          writer.subConstructorCallArg(field2),
          'angle: angle',
        );
      });

      test('generic', () {
        final source = source2DataSafe;
        final item = source.manifest.items[0];
        final field1 = item.fields[0];
        final writer = TopBuilderWriter(source);

        expect(
          writer.subConstructorCallArg(field1),
          'data: data',
        );
      });
    });

    group('method topBuilderArg', () {
      group('simple', () {
        group('null-safe', () {
          final source = source1DataSafe;
          // void windy(double velocity, double? angle);
          final item = source.manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderArg(field1),
              'required double velocity',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderArg(field2),
              'required double? angle',
            );
          });
        });

        group('legacy', () {
          final source = source1DataLegacy;
          // void windy(double velocity, double? angle);
          final item = source.manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderArg(field1),
              '@required double/*!*/ velocity',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderArg(field2),
              '@required double/*?*/ angle',
            );
          });
        });
      });

      group('generic', () {
        group('null-safe', () {
          final source = source2DataSafe;
          final item = source.manifest.items[0];
          final field1 = item.fields[0];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderArg(field1),
              'required T data',
            );
          });
        });
      });
    });

    group('method topBuilderItem', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          // void sunny();
          final item1 = source.manifest.items[0];
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          // void windy(double velocity, double? angle);
          final item3 = source.manifest.items[2];
          final writer = TopBuilderWriter(source);

          expect(
            writer.topBuilder(item1),
            '@factory\n'
            'static HiSunny sunny() => HiSunny();',
          );
          expect(
            writer.topBuilder(item2),
            '@factory\n'
            'static WeatherRainy rainy({required int rain,}) =>'
            ' WeatherRainy(rain: rain,);',
          );
          expect(
            writer.topBuilder(item3),
            '@factory\n'
            'static HelloWindy windy'
            '({required double velocity, required double? angle,})'
            ' => HelloWindy'
            '(velocity: velocity, angle: angle,);',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          // void sunny();
          final item1 = source.manifest.items[0];
          // void rainy(int rain);
          final item2 = source.manifest.items[1];
          // void windy(double velocity, double? angle);
          final item3 = source.manifest.items[2];
          final writer = TopBuilderWriter(source);

          expect(
            writer.topBuilder(item1),
            '@factory\n'
            'static HiSunny/*!*/ sunny() => HiSunny();',
          );
          expect(
            writer.topBuilder(item2),
            '@factory\n'
            'static WeatherRainy/*!*/ rainy({@required int/*!*/ rain,}) =>'
            ' WeatherRainy(rain: rain,);',
          );
          expect(
            writer.topBuilder(item3),
            '@factory\n'
            'static HelloWindy/*!*/ windy'
            '({@required double/*!*/ velocity, @required double/*?*/ angle,})'
            ' => HelloWindy'
            '(velocity: velocity, angle: angle,);',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item1 = source.manifest.items[0];
          final writer = TopBuilderWriter(source);

          expect(
            writer.topBuilder(item1),
            '@factory\n'
            'static MySuccess<T> success<T extends num>('
            '{required T data,}'
            ') => MySuccess<T>('
            'data: data,'
            ');',
          );
        });
      });
    });

    test('method topBuilderMethods', () {
      final source = source1DataLegacy;
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderMethods().joinMethods(),
        stringContainsInOrder([
          'static',
          'sunny(',
          'static',
          'rainy(',
          'static',
          'windy(',
        ]),
      );
    });
    // end of group TopBuilderWriter
  });
}
