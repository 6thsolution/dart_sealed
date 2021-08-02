import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

class _Writer extends BaseUtilsWriter {
  const _Writer(Manifest manifest) : super(manifest);
}

void main() {
  group('class BaseWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.manifest, manifest);
    });

    test('getter manifest', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.manifest, manifest);
    });

    test('annotation closed', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.annotationClosed, '@sealed');
    });

    test('annotation immutable', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.annotationImmutable, '@immutable');
    });

    test('annotation factory', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.annotationFactory, '@factory');
    });

    test('annotation override', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.annotationOverride, '@override');
    });

    group('getter n', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.n, '?');
      });
    });

    group('getter req', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.req, 'required');
      });
    });

    test('method top', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.top, 'Weather');
    });

    test('method topLower', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.topLower, 'weather');
    });

    test('method short', () {
      final manifest = manifest1Data;
      final item = manifest.items[0];
      final writer = _Writer(manifest);

      expect(writer.subUpper(item), 'Sunny');
    });

    test('method full', () {
      final manifest = manifest1Data;
      final item = manifest.items[0];
      final writer = _Writer(manifest);

      expect(writer.subFull(item), 'HiSunny');
    });

    test('method lower', () {
      final manifest = manifest1Data;
      final item = manifest.items[0];
      final writer = _Writer(manifest);

      expect(writer.subLower(item), 'sunny');
    });

    group('method typeSL', () {
      group('null-safe', () {
        final manifest = manifest1Data;
        // void windy(double velocity, double? angle);
        final item = manifest.items[2];
        final field1 = item.fields[0];
        final type1 = field1.type;
        final field2 = item.fields[1];
        final type2 = field2.type;
        final writer = _Writer(manifest);

        test('non-nullable type', () {
          expect(writer.typeSL(type1), 'double');
        });

        test('nullable type', () {
          expect(writer.typeSL(type2), 'double?');
        });
      });
    });

    test('method initThisValue', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(
        writer.initThisValue(),
        'final weather = this;',
      );
    });

    group('getter isGeneric', () {
      test('simple', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.isGeneric, isFalse);
      });

      test('generic', () {
        final manifest = manifest2Data;
        final writer = _Writer(manifest);

        expect(writer.isGeneric, isTrue);
      });
    });

    group('method genericDecPart', () {
      test('null-safe', () {
        final manifest = manifest2Data;

        final param1 = manifest.params[0];
        final writer = _Writer(manifest);

        expect(writer.genericDecPart(param1), 'T extends num');
      });
    });

    group('getter genericDec', () {
      test('simple', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.genericDec, equals(''));
      });

      test('generic', () {
        final manifest = manifest2Data;
        final writer = _Writer(manifest);

        expect(writer.genericDec, equals('<T extends num>'));
      });
    });

    group('method genericCallPart', () {
      test('null-safe', () {
        final manifest = manifest2Data;

        final param1 = manifest.params[0];
        final writer = _Writer(manifest);

        expect(writer.genericCallPart(param1), equals('T'));
      });
    });

    group('getter genericCall', () {
      test('simple', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.genericCall, equals(''));
      });

      test('generic', () {
        final manifest = manifest2Data;
        final writer = _Writer(manifest);

        expect(writer.genericCall, equals('<T>'));
      });
    });

    group('getter topDec', () {
      test('simple', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.topDec, equals('Weather'));
      });

      test('generic', () {
        final manifest = manifest2Data;
        final writer = _Writer(manifest);

        expect(writer.topDec, equals('Result<T extends num>'));
      });
    });

    group('getter topCall', () {
      test('simple', () {
        final manifest = manifest1Data;
        final writer = _Writer(manifest);

        expect(writer.topCall, equals('Weather'));
      });

      test('generic', () {
        final manifest = manifest2Data;
        final writer = _Writer(manifest);

        expect(writer.topCall, equals('Result<T>'));
      });
    });

    group('method subDec', () {
      test('simple', () {
        final manifest = manifest1Data;

        final item1 = manifest.items[0];
        final writer = _Writer(manifest);

        expect(
          writer.subDec(item1),
          equals('HiSunny'),
        );
      });

      test('generic', () {
        final manifest = manifest2Data;

        final item1 = manifest.items[0];
        final writer = _Writer(manifest);

        expect(
          writer.subDec(item1),
          equals('MySuccess<T extends num>'),
        );
      });
    });

    group('method subCall', () {
      test('simple', () {
        final manifest = manifest1Data;

        final item1 = manifest.items[0];
        final writer = _Writer(manifest);

        expect(
          writer.subCall(item1),
          equals('HiSunny'),
        );
      });

      test('generic', () {
        final manifest = manifest2Data;

        final item1 = manifest.items[0];
        final writer = _Writer(manifest);

        expect(
          writer.subCall(item1),
          equals('MySuccess<T>'),
        );
      });
    });
    // end of group BaseUtilsWriter
  });
}
