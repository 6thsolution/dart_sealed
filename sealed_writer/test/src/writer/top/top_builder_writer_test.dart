import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/top_builder_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class TopBuilderWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopBuilderWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method subConstructorCallArg', () {
      test('simple', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item = manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];
        final writer = TopBuilderWriter(manifest);

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
        final manifest = manifest2Data;
        final item = manifest.items[0];
        final field1 = item.fields[0];
        final writer = TopBuilderWriter(manifest);

        expect(
          writer.subConstructorCallArg(field1),
          'data: data',
        );
      });
    });

    group('method topBuilderArg', () {
      group('simple', () {
        group('null-safe', () {
          final manifest = manifest1Data;
          // void windy(double velocity, double? angle);
          final item = manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(manifest);

          test('non-nullable field', () {
            expect(
              writer.topBuilderDecArg(field1),
              'required double velocity',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderDecArg(field2),
              'required double? angle',
            );
          });
        });
      });

      group('generic', () {
        group('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final field1 = item.fields[0];
          final writer = TopBuilderWriter(manifest);

          test('non-nullable field', () {
            expect(
              writer.topBuilderDecArg(field1),
              'required T data',
            );
          });
        });
      });
    });

    test('method topBuilderDecArgs', () {
      final manifest = manifest1Data;
      final item3 = manifest.items[2];
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.topBuilderDecArgs(item3),
        '({required double velocity, required double? angle,})',
      );
    });

    test('method topBuilderCallArgs', () {
      final manifest = manifest1Data;
      final item3 = manifest.items[2];
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.topBuilderCallArgs(item3),
        '(velocity: velocity, angle: angle,)',
      );
    });

    group('method topBuilderWrappedDecArg', () {
      group('simple', () {
        group('null-safe', () {
          final manifest = manifest1Data;
          // void windy(double velocity, double? angle);
          final item = manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(manifest);

          test('non-nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field1),
              'double velocity',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field2),
              'double? angle',
            );
          });
        });
      });

      group('generic', () {
        group('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final field1 = item.fields[0];
          final writer = TopBuilderWriter(manifest);

          test('non-nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field1),
              'T data',
            );
          });
        });
      });
    });

    test('method topBuilderWrappedDecArgs', () {
      final manifest = manifest1Data;
      final item3 = manifest.items[2];
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.topBuilderWrappedDecArgs(item3),
        '(double velocity, double? angle,)',
      );
    });

    test('method subConstructorWrappedCallArg', () {
      final manifest = manifest1Data;
      final field = manifest.items[1].fields[0];
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.subConstructorWrappedCallArg(field),
        'rain',
      );
    });

    test('method topBuilderWrappedCallArgs', () {
      final manifest = manifest1Data;
      final item = manifest.items[1];
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.topBuilderWrappedCallArgs(item),
        '(rain,)',
      );
    });

    group('method topStaticBuilder', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          // void sunny();
          final item1 = manifest.items[0];
          // void rainy(int rain);
          final item2 = manifest.items[1];
          // void windy(double velocity, double? angle);
          final item3 = manifest.items[2];
          final writer = TopBuilderWriter(manifest);

          expect(
            writer.topStaticBuilder(item1),
            '@factory\n'
            'static HiSunny sunny() => HiSunny();',
          );
          expect(
            writer.topStaticBuilder(item2),
            '@factory\n'
            'static WeatherRainy rainy({required int rain,}) =>'
            ' WeatherRainy(rain: rain,);',
          );
          expect(
            writer.topStaticBuilder(item3),
            '@factory\n'
            'static HelloWindy windy'
            '({required double velocity, required double? angle,})'
            ' => HelloWindy'
            '(velocity: velocity, angle: angle,);',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item1 = manifest.items[0];
          final writer = TopBuilderWriter(manifest);

          expect(
            writer.topStaticBuilder(item1),
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

    group('method topFactoryBuilder', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          // void sunny();
          final item1 = manifest.items[0];
          // void rainy(int rain);
          final item2 = manifest.items[1];
          // void windy(double velocity, double? angle);
          final item3 = manifest.items[2];
          final writer = TopBuilderWriter(manifest);

          expect(
            writer.topFactoryBuilder(item1),
            'const factory Weather.sunny() = HiSunny;',
          );
          expect(
            writer.topFactoryBuilder(item2),
            'const factory Weather.rainy({required int rain,}) ='
            ' WeatherRainy;',
          );
          expect(
            writer.topFactoryBuilder(item3),
            'const factory Weather.windy'
            '({required double velocity, required double? angle,})'
            ' = HelloWindy;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item1 = manifest.items[0];
          final writer = TopBuilderWriter(manifest);

          expect(
            writer.topFactoryBuilder(item1),
            'const factory Result.success({required T data,})'
            ' = MySuccess<T>;',
          );
        });
      });
    });

    test('method topBuilderMethods', () {
      final manifest = manifest1Data;
      final writer = TopBuilderWriter(manifest);

      expect(
        writer.topBuilderMethods().joinMethods(),
        stringContainsInOrder([
          'sunny(',
          'rainy(',
          'windy(',
        ]),
      );
    });
    // end of group TopBuilderWriter
  });
}
