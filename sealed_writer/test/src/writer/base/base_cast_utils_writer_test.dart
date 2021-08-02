import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_cast_utils_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

class _Writer extends BaseCastUtilsWriter {
  const _Writer(Manifest manifest) : super(manifest);
}

void main() {
  group('class TopCastBaseWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.manifest, manifest);
    });

    group('method isSub', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final item = manifest.items[0];
          final writer = _Writer(manifest);

          expect(
            writer.isSub(item),
            'is HiSunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final writer = _Writer(manifest);

          expect(
            writer.isSub(item),
            'is MySuccess<T>',
          );
        });
      });
    });

    group('method asSub', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final item = manifest.items[0];
          final writer = _Writer(manifest);

          expect(
            writer.asSub(item),
            'as HiSunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final item = manifest.items[0];
          final writer = _Writer(manifest);

          expect(
            writer.asSub(item),
            'as MySuccess<T>',
          );
        });
      });
    });
    // end of group TopCastBaseWriter
  });
}
