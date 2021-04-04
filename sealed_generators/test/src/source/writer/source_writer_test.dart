import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../utils/code_utils.dart';
import '../../../utils/examples.dart';

void main() {
  group('extension SourceWriter', () {
    test('constant closed', () {
      expect(source1DataSafe.closed, '@sealed');
    });

    test('constant immutable', () {
      expect(source1DataSafe.immutable, '@immutable');
    });

    test('constant factory', () {
      expect(source1DataSafe.factory, '@factory');
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

    test('method topCastIs', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];

      expect(
        source.topCastIs(item).tr(),
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

    group('method topCastAs', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];

        expect(
          source.topCastAs(item).tr(),
          'WeatherSunny asSunny() => this as WeatherSunny;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];

        expect(
          source.topCastAs(item).tr(),
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

    group('method topCastAsOrNull', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsOrNull(item).tr(),
          'WeatherSunny? asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];

        expect(
          source.topCastAsOrNull(item).tr(),
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

    group('method subFieldDeclaration', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subFieldDeclaration(field1).tr(),
            'final double velocity;',
          );
        });

        test('nullable field', () {
          expect(
            source.subFieldDeclaration(field2).tr(),
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
            source.subFieldDeclaration(field1).tr(),
            'final double/*!*/ velocity;',
          );
        });

        test('nullable field', () {
          expect(
            source.subFieldDeclaration(field2).tr(),
            'final double/*?*/ angle;',
          );
        });
      });
    });

    test('method subFieldDeclarations', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item = source.manifest.items[2];

      expect(
        source.subFieldDeclarations(item).joinLines().tr(),
        stringContains([
          'final double velocity;',
          'final double? angle;',
        ]),
      );
    });

    group('method subConstructorDeclarationPart', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.subConstructorDeclarationPart(field1).tr(),
            'required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.subConstructorDeclarationPart(field2).tr(),
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
            source.subConstructorDeclarationPart(field1).tr(),
            '@required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.subConstructorDeclarationPart(field2).tr(),
            '@required this.angle',
          );
        });
      });
    });

    test('method subConstructorDeclaration', () {
      final source = source1DataSafe;
      // void sunny();
      final item1 = source.manifest.items[0];
      // void rainy(int rain);
      final item2 = source.manifest.items[1];
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];

      expect(
        source.subConstructorDeclaration(item1).tr(),
        'WeatherSunny();',
      );
      expect(
        source.subConstructorDeclaration(item2).tr(),
        'WeatherRainy({required this.rain});',
      );
      expect(
        source.subConstructorDeclaration(item3).tr(),
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

    group('method topBuilderArg', () {
      group('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item = source.manifest.items[2];
        final field1 = item.fields[0];
        final field2 = item.fields[1];

        test('non-nullable field', () {
          expect(
            source.topBuilderArg(field1).tr(),
            'required double velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.topBuilderArg(field2).tr(),
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
            source.topBuilderArg(field1).tr(),
            '@required double/*!*/ velocity',
          );
        });

        test('nullable field', () {
          expect(
            source.topBuilderArg(field2).tr(),
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
          source.topBuilder(item1).tr(),
          '@factory' 'WeatherSunny sunny() => WeatherSunny();',
        );
        expect(
          source.topBuilder(item2).tr(),
          '@factory'
          'WeatherRainy rainy({required int rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          source.topBuilder(item3).tr(),
          '@factory'
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
          source.topBuilder(item1).tr(),
          '@factory' 'WeatherSunny/*!*/ sunny() => WeatherSunny();',
        );
        expect(
          source.topBuilder(item2).tr(),
          '@factory'
          'WeatherRainy/*!*/ rainy({@required int/*!*/ rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          source.topBuilder(item3).tr(),
          '@factory'
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
