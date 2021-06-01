import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchBaseWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchBaseWriter(source);

      expect(writer.source, source);
    });

    group('method topMatchParam', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchParam,
            '<R extends Object?>',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchParam,
            '<R extends Object/*?*/>',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchParam,
            '<R extends Object?>',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchParam,
            '<R extends Object/*?*/>',
          );
        });
      });
    });

    group('method topMatchGenericNNArg', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArg(item1),
            'required R Function(HiSunny sunny) sunny',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArg(item1),
            '@required R Function(HiSunny/*!*/ sunny)/*!*/ sunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArg(item1),
            'required R Function(MySuccess<T> success) success',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArg(item1),
            '@required R Function(MySuccess<T>/*!*/ success)/*!*/ success',
          );
        });
      });
    });

    group('method topMatchGenericNNArgOrElse', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            'required R Function(Weather weather) orElse',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            '@required R Function(Weather/*!*/ weather)/*!*/ orElse',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            'required R Function(Result<T> result) orElse',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            '@required R Function(Result<T>/*!*/ result)/*!*/ orElse',
          );
        });
      });
    });

    group('method topMatchGenericNNArgOrDefault', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            'required R orDefault',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            '@required R orDefault',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            'required R orDefault',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            '@required R orDefault',
          );
        });
      });
    });

    group('method topMatchGenericNArg', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(HiSunny sunny)? sunny',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(HiSunny/*!*/ sunny)/*?*/ sunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(MySuccess<T> success)? success',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(MySuccess<T>/*!*/ success)/*?*/ success',
          );
        });
      });
    });

    group('method topMatchVoidNNArg', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArg(item1),
            'required void Function(HiSunny sunny) sunny',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArg(item1),
            '@required void Function(HiSunny/*!*/ sunny)/*!*/ sunny',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArg(item1),
            'required void Function(MySuccess<T> success) success',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArg(item1),
            '@required void Function(MySuccess<T>/*!*/ success)/*!*/ success',
          );
        });
      });
    });

    group('method topMatchVoidNNArgOrElse', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            'required void Function(Weather weather) orElse',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            '@required void Function(Weather/*!*/ weather)/*!*/ orElse',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            'required void Function(Result<T> result) orElse',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            '@required void Function(Result<T>/*!*/ result)/*!*/ orElse',
          );
        });
      });
    });

    group('method topMatchVoidNArg', () {
      group('simple', () {
        test('null-safe', () {
          final source = source1DataSafe;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(HiSunny sunny)? sunny',
          );
        });

        test('legacy', () {
          final source = source1DataLegacy;
          final manifest = source.manifest;
          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(HiSunny/*!*/ sunny)/*?*/ sunny',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final source = source2DataSafe;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(MySuccess<T> success)? success',
          );
        });

        test('legacy', () {
          final source = source2DataLegacy;
          final manifest = source.manifest;
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(source);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(MySuccess<T>/*!*/ success)/*?*/ success',
          );
        });
      });
    });

    test('method topMatchAssert', () {
      final source = source1DataLegacy;
      final manifest = source.manifest;
      // sunny
      final item1 = manifest.items[0];
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchAssert(item1),
        'assert(sunny != null);',
      );
    });

    test('method topMatchAssertOrElse', () {
      final source = source1DataLegacy;
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchAssertOrElse(),
        'assert(orElse != null);',
      );
    });

    test('method topMatchAssertOrDefault', () {
      final source = source1DataLegacy;
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchAssertOrDefault(),
        'assert(orDefault != null);',
      );
    });

    test('method topMatchAsserts', () {
      final source = source1DataLegacy;
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchAsserts(),
        stringContainsInOrder([
          'assert(sunny != null);',
          'rainy',
          'windy',
        ]),
      );
    });

    test('method throwAssertion', () {
      final source = source1DataSafe;
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.throwAssertion(),
        'throw AssertionError();',
      );
    });

    test('method throwingElse', () {
      final source = source1DataSafe;
      final writer = TopMatchBaseWriter(source);
      final e = writer.throwingElse();

      expect(e.code, 'throw AssertionError();');
    });

    test('method topMatchWrappedItemArg', () {
      final source = source3DataSafe;
      final field = source.manifest.items[2].fields[1];
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchWrappedItemArg(field),
        'int? z',
      );
    });

    test('method topMatchWrappedItemArgs', () {
      final source = source3DataSafe;
      final item = source.manifest.items[2];
      final writer = TopMatchBaseWriter(source);

      expect(
        writer.topMatchWrappedItemArgs(item),
        '(int y, int? z)',
      );
    });

    group('method topMatchWrappedGenericNNArg', () {
      test('null-safe', () {
        final source = source3DataSafe;
        final item = source.manifest.items[2];
        final writer = TopMatchBaseWriter(source);

        expect(
          writer.topMatchWrappedGenericNNArg(item),
          'required R Function(int y, int? z) three',
        );
      });

      test('legacy', () {
        final source = source3DataLegacy;
        final item = source.manifest.items[2];
        final writer = TopMatchBaseWriter(source);

        expect(
          writer.topMatchWrappedGenericNNArg(item),
          '@required R Function(int/*!*/ y, int/*?*/ z)/*!*/ three',
        );
      });
    });
    // end of group TopMatchBaseWriter
  });
}
