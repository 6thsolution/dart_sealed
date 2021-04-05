import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../utils/code_utils.dart';
import '../../../utils/examples.dart';

void main() {
  group('extension SourceWriter', () {
    test('getter opts', () {
      final options = optionsDataSafe;
      final manifest = manifest1;
      final source = Source(options: options, manifest: manifest);
      final writer = SourceWriter(source);

      expect(writer.opts, options);
    });

    test('getter man', () {
      final options = optionsDataSafe;
      final manifest = manifest1;
      final source = Source(options: options, manifest: manifest);
      final writer = SourceWriter(source);

      expect(writer.man, manifest);
    });

    test('constant closed', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(writer.closed, '@sealed');
    });

    test('constant immutable', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(writer.immutable, '@immutable');
    });

    test('constant factory', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(writer.factory, '@factory');
    });

    test('constant over', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(writer.over, '@override');
    });

    group('getter n', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(writer.n, '?');
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(writer.n, '/*?*/');
      });
    });

    group('getter nl', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(writer.nl, '');
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(writer.nl, '/*?*/');
      });
    });

    group('getter nn', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(writer.nn, '');
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(writer.nn, '/*!*/');
      });
    });

    group('getter req', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(writer.req, 'required');
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(writer.req, '@required');
      });
    });

    test('method top', () {
      final source = source1DataLegacy;
      final writer = SourceWriter(source);

      expect(writer.top, 'Weather');
    });

    test('method short', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];
      final writer = SourceWriter(source);

      expect(writer.short(item), 'Sunny');
    });

    test('method full', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];
      final writer = SourceWriter(source);

      expect(writer.full(item), 'WeatherSunny');
    });

    test('method lower', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];
      final writer = SourceWriter(source);

      expect(writer.lower(item), 'sunny');
    });

    test('method topCastIs', () {
      final source = source1DataSafe;
      final item = source.manifest.items[0];
      final writer = SourceWriter(source);

      expect(
        writer.topCastIs(item).tr(),
        'bool isSunny() => this is WeatherSunny;',
      );
    });

    test('method topCastsIs', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.topCastsIs().joinMethods().tr(),
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
        final writer = SourceWriter(source);

        expect(
          writer.topCastAs(item).tr(),
          'WeatherSunny asSunny() => this as WeatherSunny;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topCastAs(item).tr(),
          'WeatherSunny/*!*/ asSunny() => this as WeatherSunny;',
        );
      });
    });

    test('method topCastsAs', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.topCastsAs().joinMethods().tr(),
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
        final writer = SourceWriter(source);

        expect(
          writer.topCastAsOrNull(item).tr(),
          'WeatherSunny? asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final item = source.manifest.items[0];
        final writer = SourceWriter(source);

        expect(
          writer.topCastAsOrNull(item).tr(),
          'WeatherSunny/*?*/ asSunnyOrNull() => '
          'this is WeatherSunny ? this as WeatherSunny : null;',
        );
      });
    });

    test('method topCastsAsOrNull', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.topCastsAsOrNull().joinMethods().tr(),
        stringContains([
          'asSunnyOrNull()',
          'asRainyOrNull()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topCasts', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.topCasts().joinMethods().tr(),
        stringContains([
          'isSunny()',
          'asRainy()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topManifest', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.topManifest(),
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
        final writer = SourceWriter(source);

        test('non-nullable type', () {
          expect(writer.typeSL(type1), 'double');
        });

        test('nullable type', () {
          expect(writer.typeSL(type2), 'double?');
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
        final writer = SourceWriter(source);

        test('non-nullable type', () {
          expect(writer.typeSL(type1), 'double/*!*/');
        });

        test('nullable type', () {
          expect(writer.typeSL(type2), 'double/*?*/');
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
        final writer = SourceWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subFieldDeclaration(field1),
            'final double velocity;',
          );
        });

        test('nullable field', () {
          expect(
            writer.subFieldDeclaration(field2),
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
        final writer = SourceWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subFieldDeclaration(field1),
            'final double/*!*/ velocity;',
          );
        });

        test('nullable field', () {
          expect(
            writer.subFieldDeclaration(field2),
            'final double/*?*/ angle;',
          );
        });
      });
    });

    test('method subFieldDeclarations', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item = source.manifest.items[2];
      final writer = SourceWriter(source);

      expect(
        writer.subFieldDeclarations(item).tr(),
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
        final writer = SourceWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field1),
            'required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field2),
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
        final writer = SourceWriter(source);

        test('non-nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field1),
            '@required this.velocity',
          );
        });

        test('nullable field', () {
          expect(
            writer.subConstructorDeclarationPart(field2),
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
      final writer = SourceWriter(source);

      expect(
        writer.subConstructorDeclaration(item1).tr(),
        'WeatherSunny();',
      );
      expect(
        writer.subConstructorDeclaration(item2).tr(),
        'WeatherRainy({required this.rain});',
      );
      expect(
        writer.subConstructorDeclaration(item3).tr(),
        'WeatherWindy({required this.velocity, required this.angle,});',
      );
    });

    test('method subConstructorCallArg', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item = source.manifest.items[2];
      final field1 = item.fields[0];
      final field2 = item.fields[1];
      final writer = SourceWriter(source);

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
        final writer = SourceWriter(source);

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
        final writer = SourceWriter(source);

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
        final writer = SourceWriter(source);

        expect(
          writer.topBuilder(item1).tr(),
          '@factory' 'static WeatherSunny sunny() => WeatherSunny();',
        );
        expect(
          writer.topBuilder(item2).tr(),
          '@factory'
          'static WeatherRainy rainy({required int rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          writer.topBuilder(item3).tr(),
          '@factory'
          'static WeatherWindy windy'
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
        final writer = SourceWriter(source);

        expect(
          writer.topBuilder(item1).tr(),
          '@factory' 'static WeatherSunny/*!*/ sunny() => WeatherSunny();',
        );
        expect(
          writer.topBuilder(item2).tr(),
          '@factory'
          'static WeatherRainy/*!*/ rainy({@required int/*!*/ rain}) =>'
          ' WeatherRainy(rain: rain);',
        );
        expect(
          writer.topBuilder(item3).tr(),
          '@factory'
          'static WeatherWindy/*!*/ windy'
          '({@required double/*!*/ velocity, @required double/*?*/ angle,})'
          ' => WeatherWindy'
          '(velocity: velocity, angle: angle,);',
        );
      });
    });

    test('method topBuilders', () {
      final source = source1DataLegacy;
      final writer = SourceWriter(source);

      expect(
        writer.topBuilders().joinMethods().tr(),
        stringContains([
          'static',
          'sunny(',
          'rainy(',
          'windy(',
        ]),
      );
    });

    test('method subToStringPart', () {
      final source = source1DataLegacy;
      // void rainy(int rain);
      final item = source.manifest.items[1];
      final field = item.fields[0];
      final writer = SourceWriter(source);

      expect(
        writer.subToStringPart(field),
        r'rain: $rain',
      );
    });

    group('method subToString', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SourceWriter(source);

        expect(
          writer.subToString(item1).tr(),
          '@override'
          r"String toString() => 'Weather.sunny()';",
        );
        expect(
          writer.subToString(item2).tr(),
          '@override'
          r"String toString() => 'Weather.rainy(rain: $rain)';",
        );
        expect(
          writer.subToString(item3).tr(),
          '@override'
          "String toString() => 'Weather.windy"
          r"(velocity: $velocity, angle: $angle)';",
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subToString(item2).tr(),
          '@override'
          r"String/*!*/ toString() => 'Weather.rainy(rain: $rain)';",
        );
      });
    });

    group('method topDistinctEquality', () {
      test('null-safe', () {
        final source = source1DataSafe;
        final writer = SourceWriter(source);

        expect(
          writer.topDistinctEquality().tr(),
          '@override'
          'bool operator ==(Object other) => false;',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        final writer = SourceWriter(source);

        expect(
          writer.topDistinctEquality().tr(),
          '@override'
          'bool/*!*/ operator ==(Object/*?*/ other) => false;',
        );
      });
    });

    group('method topDistinctEquality', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final writer = SourceWriter(source);

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
        final writer = SourceWriter(source);

        expect(
          writer.subEquatableEquality(item3).tr(),
          '@override'
          'List<Object/*?*/>/*!*/ get props => [velocity, angle,];',
        );
      });
    });

    group('method subCopyDeclarationPart', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final field1 = item3.fields[0];
        final field2 = item3.fields[1];
        final writer = SourceWriter(source);

        expect(
          writer.subCopyDeclarationPart(field1),
          'double? velocity',
        );
        expect(
          writer.subCopyDeclarationPart(field2),
          'double? angle',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void windy(double velocity, double? angle);
        final item3 = source.manifest.items[2];
        final field1 = item3.fields[0];
        final field2 = item3.fields[1];
        final writer = SourceWriter(source);

        expect(
          writer.subCopyDeclarationPart(field1),
          'double/*?*/ velocity',
        );
        expect(
          writer.subCopyDeclarationPart(field2),
          'double/*?*/ angle',
        );
      });
    });

    test('method subCopyCalcPart', () {
      final source = source1DataSafe;
      // void windy(double velocity, double? angle);
      final item3 = source.manifest.items[2];
      final field1 = item3.fields[0];
      final field2 = item3.fields[1];
      final writer = SourceWriter(source);

      expect(
        writer.subCopyCalcPart(field1),
        'velocity: velocity ?? this.velocity',
      );
      expect(
        writer.subCopyCalcPart(field2),
        'angle: angle ?? this.angle',
      );
    });

    group('method subCopyDeclaration', () {
      test('null-safe', () {
        final source = source1DataSafe;
        // void sunny();
        final item1 = source.manifest.items[0];
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subCopyDeclaration(item1).tr(),
          '@factory'
          'WeatherSunny copy() =>'
          ' WeatherSunny();',
        );
        expect(
          writer.subCopyDeclaration(item2).tr(),
          '@factory'
          'WeatherRainy copy({int? rain}) =>'
          ' WeatherRainy(rain: rain ?? this.rain);',
        );
      });

      test('legacy', () {
        final source = source1DataLegacy;
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subCopyDeclaration(item2).tr(),
          '@factory'
          'WeatherRainy/*!*/ copy({int/*?*/ rain}) =>'
          ' WeatherRainy(rain: rain ?? this.rain);',
        );
      });
    });

    group('method subClass', () {
      test('equality data', () {
        final options = optionsDataSafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subClass(item2).tr(),
          allOf(
            startsWith('class WeatherRainy extends Weather{'),
            endsWith('}'),
            stringContains([
              'WeatherRainy({required this.rain});',
              'final int rain;',
              'WeatherRainy copy(',
              'String toString(',
              'get props'
            ]),
          ),
        );
      });

      test('equality identity', () {
        final options = optionsIdentitySafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subClass(item2).tr(),
          isNot(stringContains(['get props'])),
        );
      });

      test('equality distinct', () {
        final options = optionsDistinctSafe;
        final manifest = manifest1;
        final source = Source(options: options, manifest: manifest);
        // void rainy(int rain);
        final item2 = source.manifest.items[1];
        final writer = SourceWriter(source);

        expect(
          writer.subClass(item2).tr(),
          isNot(stringContains(['get props'])),
        );
      });
    });
    // end of source writer test group
  });
}
