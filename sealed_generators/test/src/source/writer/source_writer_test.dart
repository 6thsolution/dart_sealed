import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../utils/code_utils.dart';
import '../../../utils/examples.dart';

void main() {
  group('extension SourceWriter', () {
    test('constant finalClassAnnotation', () {
      expect(source1DataSafe.closed, '@sealed');
    });

    test('constant immutableClassAnnotation', () {
      expect(source1DataSafe.immutable, '@immutable');
    });

    group('getter n', () {
      test('null-safe', () {
        expect(source1DataSafe.n, '?');
      });

      test('legacy', () {
        expect(source1DataLegacy.n, '/*?*/');
      });
    });

    group('getter nn', () {
      test('null-safe', () {
        expect(source1DataSafe.nn, '');
      });

      test('legacy', () {
        expect(source1DataLegacy.nn, '/*!*/');
      });
    });

    group('getter req', () {
      test('null-safe', () {
        expect(source1DataSafe.req, 'required');
      });

      test('legacy', () {
        expect(source1DataLegacy.req, '@required');
      });
    });

    test('method top', () {
      expect(source1DataSafe.top, 'Weather');
    });

    test('method short', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];

      expect(source.short(item), 'Sunny');
    });

    test('method full', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];

      expect(source.full(item), 'WeatherSunny');
    });

    test('method lower', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];

      expect(source.lower(item), 'sunny');
    });

    test('method topCastIsItem', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];

      expect(
        source.topCastIsItem(item).tr(),
        'bool isSunny() => this is WeatherSunny;',
      );
    });

    test('method topCastsIs', () {
      expect(
        source1DataSafe.topCastsIs().joinMethods().tr(),
        stringContains([
          'isSunny()',
          'isRainy()',
          'isWindy()',
        ]),
      );
    });

    group('method topCastAsItem', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsItem(item).tr(),
          'WeatherSunny asSunny() => this as WeatherSunny;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsItem(item).tr(),
          'WeatherSunny/*!*/ asSunny() => this as WeatherSunny;',
        );
      });
    });

    test('method topCastsAs', () {
      expect(
        source1DataSafe.topCastsAs().joinMethods().tr(),
        stringContains([
          'asSunny()',
          'asRainy()',
          'asWindy()',
        ]),
      );
    });

    group('method topCastAsOrNullItem', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsOrNullItem(item).tr(),
          'WeatherSunny? asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsOrNullItem(item).tr(),
          'WeatherSunny/*?*/ asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });
    });

    test('method topCastsAsOrNull', () {
      expect(
        source1DataSafe.topCastsAsOrNull().joinMethods().tr(),
        stringContains([
          'asSunnyOrNull()',
          'asRainyOrNull()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topCasts', () {
      expect(
        source1DataSafe.topCasts().joinMethods().tr(),
        stringContains([
          'isSunny()',
          'asRainy()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topManifest', () {
      expect(
        source1DataSafe.topManifest().tr(),
        '@SealedManifest(_Weather)',
      );
    });

    group('method typeSL', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final type1 = field1.type;
        final field2 = item.fields[1];
        final type2 = field2.type;

        test('non-nullable type', () {
          expect(source.typeSL(type1), 'double');
        });

        test('nullable type', () {
          expect(source.typeSL(type2), 'double?');
        });
      });

      group('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final type1 = field1.type;
        final field2 = item.fields[1];
        final type2 = field2.type;

        test('non-nullable type', () {
          expect(source.typeSL(type1), 'double/*!*/');
        });

        test('nullable type', () {
          expect(source.typeSL(type2), 'double/*?*/');
        });
      });
    });

    group('method subField', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subField(field1).tr(),
            'final double velocity;',
          );
        });

        test('nullable field', () {
          expect(
            source.subField(field2).tr(),
            'final double? angle;',
          );
        });
      });

      group('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subField(field1).tr(),
            'final double/*!*/ velocity;',
          );
        });

        test('nullable field', () {
          expect(
            source.subField(field2).tr(),
            'final double/*?*/ angle;',
          );
        });
      });
    });

    test('method subFields', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item = source.manifest.items[2];

      expect(
        source.subFields(item).joinMethods().tr(),
        stringContains([
          'final double velocity;',
          'final double? angle;',
        ]),
      );
    });

    group('method subConstructorField', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subConstructorField(field1).tr(),
            'required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.subConstructorField(field2).tr(),
            'required this.angle',
          );
        });
      });

      group('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subConstructorField(field1).tr(),
            '@required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.subConstructorField(field2).tr(),
            '@required this.angle',
          );
        });
      });
    });

    test('method subConstructor', () {
      final source = source1DataSafe;
      // void sunny();
      final item1 = source.manifest.items[0];
      // void rainy(int rain);
      final item2 = source.manifest.items[1];
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];

      expect(
        source.subConstructor(item1).tr(),
        'WeatherSunny();',
      );
      expect(
        source.subConstructor(item2).tr(),
        'WeatherRainy({required this.rain});',
      );
      expect(
        source.subConstructor(item3).tr(),
        'WeatherWindy({required this.velocity, required this.angle,});',
      );
    });

    test('method subConstructorCallArg', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item = source.manifest.items[2];
      final field1 = item.fields[0];
      final field2 = item.fields[1];

      expect(
        source.subConstructorCallArg(field1).tr(),
        'velocity: velocity',
      );
      expect(
        source.subConstructorCallArg(field2).tr(),
        'angle: angle',
      );
    });

    group('method topBuilderItemArg', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.topBuilderItemArg(field1).tr(),
            'required double velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.topBuilderItemArg(field2).tr(),
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

        test('non-nullable field', () {
          expect(
            source.topBuilderItemArg(field1).tr(),
            '@required double/*!*/ velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.topBuilderItemArg(field2).tr(),
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

        expect(
          source.topBuilderItem(item1).tr(),
          'WeatherSunny sunny() => WeatherSunny();',
        );
        expect(
          source.topBuilderItem(item2).tr(),
          'WeatherRainy rainy({required int rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          source.topBuilderItem(item3).tr(),
          'WeatherWindy windy'
          '({required double velocity, required double? angle,})'
          ' => WeatherWindy'
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

        expect(
          source.topBuilderItem(item1).tr(),
          'WeatherSunny/*!*/ sunny() => WeatherSunny();',
        );
        expect(
          source.topBuilderItem(item2).tr(),
          'WeatherRainy/*!*/ rainy({@required int/*!*/ rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          source.topBuilderItem(item3).tr(),
          'WeatherWindy/*!*/ windy'
          '({@required double/*!*/ velocity, @required double/*?*/ angle,})'
          ' => WeatherWindy'
          '(velocity: velocity, angle: angle,);',
        );
      });
    });

    test('method topBuilders', () {
      expect(
        source1DataSafe.topBuilders().joinMethods().tr(),
        stringContains([
          'sunny(',
          'rainy(',
          'windy(',
        ]),
      );
    });
  });
}
