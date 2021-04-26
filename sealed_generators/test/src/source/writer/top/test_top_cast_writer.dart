import 'package:sealed_generators/src/source/writer/top/top_cast_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopCastWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(writer.source, source);
    });

    group('method topCastIs', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastIs(item),
            'bool isSunny() => this is HiSunny;',
          );
        });
        test('legacy', () {
          final source = source1DataLegacy;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastIs(item),
            'bool/*!*/ isSunny() => this is HiSunny;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastIs(item),
            'bool isSuccess() => this is MySuccess<T>;',
          );
        });
      });
    });

    test('method topCastsIs', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsIs().joinMethods(),
        stringContainsInOrder([
          'isSunny()',
          'isRainy()',
          'isWindy()',
        ]),
      );
    });

    group('method topCastAs', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAs(item),
            'HiSunny asSunny() => this as HiSunny;',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAs(item),
            'HiSunny/*!*/ asSunny() => this as HiSunny;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAs(item),
            'MySuccess<T> asSuccess() => this as MySuccess<T>;',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAs(item),
            'MySuccess<T>/*!*/ asSuccess() => this as MySuccess<T>;',
          );
        });
      });
    });

    test('method topCastsAs', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsAs().joinMethods(),
        stringContainsInOrder([
          'asSunny()',
          'asRainy()',
          'asWindy()',
        ]),
      );
    });

    group('method topCastAsOrNull', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAsOrNull(item),
            'HiSunny? asSunnyOrNull() {\n'
            'final weather = this;\n'
            'return weather is HiSunny ? weather : null;\n'
            '}',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAsOrNull(item),
            'HiSunny/*?*/ asSunnyOrNull() {\n'
            'final weather = this;\n'
            'return weather is HiSunny ? weather : null;\n'
            '}',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final item = source.manifest.items[0];
          final writer = TopCastWriter(source);

          expect(
            writer.topCastAsOrNull(item),
            'MySuccess<T>? asSuccessOrNull() {\n'
            'final result = this;\n'
            'return result is MySuccess<T> ? result : null;\n'
            '}',
          );
        });
      });
    });

    test('method topCastsAsOrNull', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastsAsOrNull().joinMethods(),
        stringContainsInOrder([
          'asSunnyOrNull()',
          'asRainyOrNull()',
          'asWindyOrNull()',
        ]),
      );
    });

    test('method topCastMethods', () {
      final source = source1DataSafe;
      final writer = TopCastWriter(source);

      expect(
        writer.topCastMethods().joinMethods(),
        stringContainsInOrder([
          'isSunny()',
          'asRainy()',
          'asWindyOrNull()',
        ]),
      );
    });
    // end of group TopCastWriter
  });
}
