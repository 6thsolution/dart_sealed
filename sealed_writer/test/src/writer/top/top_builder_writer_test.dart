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

        group('legacy', () {
          final source = source1DataLegacy;
          // void windy(double velocity, double? angle);
          final item = source.manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderDecArg(field1),
              '@required double/*!*/ velocity',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderDecArg(field2),
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
              writer.topBuilderDecArg(field1),
              'required T data',
            );
          });
        });
      });
    });

    test('method topBuilderDecArgs', () {
      final source = source1DataSafe;
      final item3 = source.manifest.items[2];
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderDecArgs(item3),
        '({required double velocity, required double? angle,})',
      );
    });

    test('method topBuilderCallArgs', () {
      final source = source1DataSafe;
      final item3 = source.manifest.items[2];
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderCallArgs(item3),
        '(velocity: velocity, angle: angle,)',
      );
    });

    group('method topBuilderWrappedDecArg', () {
      group('simple', () {
        group('null-safe', () {
          final source = source3DataSafe;
          // void windy(double velocity, double? angle);
          final item = source.manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field1),
              'int y',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field2),
              'int? z',
            );
          });
        });

        group('legacy', () {
          final source = source3DataLegacy;
          final item = source.manifest.items[2];
          final field1 = item.fields[0];
          final field2 = item.fields[1];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field1),
              'int/*!*/ y',
            );
          });

          test('nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field2),
              'int/*?*/ z',
            );
          });
        });
      });

      group('generic', () {
        group('null-safe', () {
          final source = source4DataSafe;
          final item = source.manifest.items[0];
          final field1 = item.fields[0];
          final writer = TopBuilderWriter(source);

          test('non-nullable field', () {
            expect(
              writer.topBuilderWrappedDecArg(field1),
              'T x',
            );
          });
        });
      });
    });

    test('method topBuilderWrappedDecArgs', () {
      final source = source3DataSafe;
      final item3 = source.manifest.items[2];
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderWrappedDecArgs(item3),
        '(int y, int? z,)',
      );
    });

    group('method topBuilderNonOrWrappedDecArgs', () {
      test('non-wrapped', () {
        final source = source1DataSafe;
        final item3 = source.manifest.items[2];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topBuilderNonOrWrappedDecArgs(item3),
          '({required double velocity, required double? angle,})',
        );
      });

      test('wrapped', () {
        final source = source3DataSafe;
        final item3 = source.manifest.items[2];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topBuilderNonOrWrappedDecArgs(item3),
          '(int y, int? z,)',
        );
      });
    });

    test('method subConstructorWrappedCallArg', () {
      final source = source3DataSafe;
      final field = source.manifest.items[1].fields[0];
      final writer = TopBuilderWriter(source);

      expect(
        writer.subConstructorWrappedCallArg(field),
        'x',
      );
    });

    test('method topBuilderWrappedCallArgs', () {
      final source = source3DataSafe;
      final item = source.manifest.items[1];
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderWrappedCallArgs(item),
        '(x,)',
      );
    });

    group('method topBuilderNonOrWrappedCallArgs', () {
      test('non-wrapped', () {
        final source = source1DataSafe;
        final item = source.manifest.items[1];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topBuilderNonOrWrappedCallArgs(item),
          '(rain: rain,)',
        );
      });

      test('wrapped', () {
        final source = source3DataSafe;
        final item = source.manifest.items[1];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topBuilderNonOrWrappedCallArgs(item),
          '(x,)',
        );
      });
    });

    group('method topStaticBuilder', () {
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
            writer.topStaticBuilder(item1),
            '@factory\n'
            'static HiSunny/*!*/ sunny() => HiSunny();',
          );
          expect(
            writer.topStaticBuilder(item2),
            '@factory\n'
            'static WeatherRainy/*!*/ rainy({@required int/*!*/ rain,}) =>'
            ' WeatherRainy(rain: rain,);',
          );
          expect(
            writer.topStaticBuilder(item3),
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

      test('simple wrapped null-safe', () {
        final source = source3DataSafe;
        final item2 = source.manifest.items[1];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topStaticBuilder(item2),
          '@factory\n'
          'static BaseTwo two(int x,) => BaseTwo(x,);',
        );
      });
    });

    group('method topFactoryBuilder', () {
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
            writer.topFactoryBuilder(item1),
            'const factory Weather.sunny() = HiSunny;',
          );
          expect(
            writer.topFactoryBuilder(item2),
            'const factory Weather.rainy({@required int/*!*/ rain,}) ='
            ' WeatherRainy;',
          );
          expect(
            writer.topFactoryBuilder(item3),
            'const factory Weather.windy'
            '({@required double/*!*/ velocity, @required double/*?*/ angle,})'
            ' = HelloWindy;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item1 = source.manifest.items[0];
          final writer = TopBuilderWriter(source);

          expect(
            writer.topFactoryBuilder(item1),
            'const factory Result.success({required T data,})'
            ' = MySuccess<T>;',
          );
        });
      });

      test('simple wrapped null-safe', () {
        final source = source3DataSafe;
        final item2 = source.manifest.items[1];
        final writer = TopBuilderWriter(source);

        expect(
          writer.topFactoryBuilder(item2),
          'const factory Base.two(int x,) = BaseTwo;',
        );
      });
    });

    test('method topBuilderMethods', () {
      final source = source1DataLegacy;
      final writer = TopBuilderWriter(source);

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
