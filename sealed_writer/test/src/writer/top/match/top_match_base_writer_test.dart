import 'package:sealed_writer/src/writer/top/match/top_match_base_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchBaseWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchBaseWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method topMatchParam', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchParam,
            '<R extends Object?>',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchParam,
            '<R extends Object?>',
          );
        });
      });
    });

    group('method topMatchGenericNNArg', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;

          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArg(item1),
            'required R Function(HiSunny sunny) sunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;

          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArg(item1),
            'required R Function(MySuccess<T> success) success',
          );
        });
      });
    });

    group('method topMatchGenericNNArgOrElse', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            'required R Function(Weather weather) orElse',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArgOrElse(),
            'required R Function(Result<T> result) orElse',
          );
        });
      });
    });

    group('method topMatchGenericNNArgOrDefault', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            'required R orDefault',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNNArgOrDefault(),
            'required R orDefault',
          );
        });
      });
    });

    group('method topMatchGenericNArg', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;

          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(HiSunny sunny)? sunny',
          );
        });
      });

      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;

          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchGenericNArg(item1),
            'R Function(MySuccess<T> success)? success',
          );
        });
      });
    });

    group('method topMatchVoidNNArg', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;

          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNNArg(item1),
            'required void Function(HiSunny sunny) sunny',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;

          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNNArg(item1),
            'required void Function(MySuccess<T> success) success',
          );
        });
      });
    });

    group('method topMatchVoidNNArgOrElse', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            'required void Function(Weather weather) orElse',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNNArgOrElse(),
            'required void Function(Result<T> result) orElse',
          );
        });
      });
    });

    group('method topMatchVoidNArg', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;

          // sunny
          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(HiSunny sunny)? sunny',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;

          final item1 = manifest.items[0];
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNArg(item1),
            'void Function(MySuccess<T> success)? success',
          );
        });
      });
    });

    test('method throwAssertion', () {
      final manifest = manifest1Data;
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.throwAssertion(),
        'throw AssertionError();',
      );
    });

    test('method throwingElse', () {
      final manifest = manifest1Data;
      final writer = TopMatchBaseWriter(manifest);
      final e = writer.throwingElse();

      expect(e.code, 'throw AssertionError();');
    });

    test('method topMatchWrappedItemArg', () {
      final manifest = manifest3Data;
      final field = manifest.items[2].fields[1];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemArg(field),
        'int? z',
      );
    });

    test('method topMatchWrappedItemArgs', () {
      final manifest = manifest3Data;
      final item = manifest.items[2];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemArgs(item),
        '(int y, int? z)',
      );
    });

    group('method topMatchWrappedGenericNNArg', () {
      test('null-safe', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedGenericNNArg(item),
          'required R Function(int y, int? z) three',
        );
      });
    });

    group('method topMatchWrappedGenericNArg', () {
      test('null-safe', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedGenericNArg(item),
          'R Function(int y, int? z)? three',
        );
      });
    });

    group('method topMatchWrappedVoidNNArg', () {
      test('null-safe', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedVoidNNArg(item),
          'required void Function(int y, int? z) three',
        );
      });
    });

    group('method topMatchWrappedVoidNArg', () {
      test('null-safe', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedVoidNArg(item),
          'void Function(int y, int? z)? three',
        );
      });
    });

    test('method topMatchWrappedItemCallArg', () {
      final manifest = manifest3Data;
      final field = manifest.items[2].fields[1];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemCallArg(field),
        'base.z',
      );
    });

    test('method topMatchWrappedItemCallArgs', () {
      final manifest = manifest3Data;
      final item = manifest.items[2];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemCallArgs(item),
        '(base.y, base.z)',
      );
    });

    test('method topMatchItemCallArgs', () {
      final manifest = manifest1Data;
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchItemCallArgs(),
        '(weather)',
      );
    });

    group('method topMatchNonOrWrappedItemCallArgs', () {
      test('wrapped', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedItemCallArgs(item),
          '(base.y, base.z)',
        );
      });

      test('non-wrapped', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedItemCallArgs(item),
          '(weather)',
        );
      });
    });

    group('method topMatchNonOrWrappedGenericNNArg', () {
      test('wrapped', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedGenericNNArg(item),
          'required R Function(int y, int? z) three',
        );
      });

      test('non-wrapped', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedGenericNNArg(item),
          'required R Function(HelloWindy windy) windy',
        );
      });
    });

    group('method topMatchNonOrWrappedGenericNArg', () {
      test('wrapped', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedGenericNArg(item),
          'R Function(int y, int? z)? three',
        );
      });

      test('non-wrapped', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedGenericNArg(item),
          'R Function(HelloWindy windy)? windy',
        );
      });
    });

    group('method topMatchNonOrWrappedVoidNNArg', () {
      test('wrapped', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedVoidNNArg(item),
          'required void Function(int y, int? z) three',
        );
      });

      test('non-wrapped', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedVoidNNArg(item),
          'required void Function(HelloWindy windy) windy',
        );
      });
    });

    group('method topMatchNonOrWrappedVoidNArg', () {
      test('wrapped', () {
        final manifest = manifest3Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedVoidNArg(item),
          'void Function(int y, int? z)? three',
        );
      });

      test('non-wrapped', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchNonOrWrappedVoidNArg(item),
          'void Function(HelloWindy windy)? windy',
        );
      });
    });
    // end of group TopMatchBaseWriter
  });
}
