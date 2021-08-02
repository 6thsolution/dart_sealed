import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/top/top_cast_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class TopCastWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopCastWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topCastIs', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

          expect(
            writer.topCastIs(item),
            'bool isSunny() => this is HiSunny;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

          expect(
            writer.topCastIs(item),
            'bool isSuccess() => this is MySuccess<T>;',
          );
        });
      });
    });

    test('method topCastsIs', () {
      final manifest = manifest1Data;
      final writer = TopCastWriter(manifest);

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
          final manifest = manifest1Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

          expect(
            writer.topCastAs(item),
            'HiSunny asSunny() => this as HiSunny;',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

          expect(
            writer.topCastAs(item),
            'MySuccess<T> asSuccess() => this as MySuccess<T>;',
          );
        });
      });
    });

    test('method topCastsAs', () {
      final manifest = manifest1Data;
      final writer = TopCastWriter(manifest);

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
          final manifest = manifest1Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

          expect(
            writer.topCastAsOrNull(item),
            'HiSunny? asSunnyOrNull() {\n'
            'final weather = this;\n'
            'return weather is HiSunny ? weather : null;\n'
            '}',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final writer = TopCastWriter(manifest);

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
      final manifest = manifest1Data;
      final writer = TopCastWriter(manifest);

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
      final manifest = manifest1Data;
      final writer = TopCastWriter(manifest);

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
