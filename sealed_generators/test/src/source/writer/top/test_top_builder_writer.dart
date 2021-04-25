import 'package:sealed_generators/src/source/writer/top/top_builder_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopBuilderWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopBuilderWriter(source);

      expect(writer.source, source);
    });

    test('method subConstructorCallArg', () {
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

    group('method topBuilderArg', () {
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

    group('method topBuilderItem', () {
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

    test('method topBuilderMethods', () {
      final source = source1DataLegacy;
      final writer = TopBuilderWriter(source);

      expect(
        writer.topBuilderMethods().joinMethods(),
        stringContainsInOrder([
          'static',
          'sunny(',
          'rainy(',
          'windy(',
        ]),
      );
    });
    // end of group TopBuilderWriter
  });
}
