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

    group('method topMatchVoidNArgOrElse', () {
      group('simple', () {
        test('null-safe', () {
          final manifest = manifest1Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNArgOrElse(),
            'void Function(Weather weather)? orElse',
          );
        });
      });
      group('generic', () {
        test('null-safe', () {
          final manifest = manifest2Data;
          final writer = TopMatchBaseWriter(manifest);

          expect(
            writer.topMatchVoidNArgOrElse(),
            'void Function(Result<T> result)? orElse',
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
      final manifest = manifest1Data;
      final field = manifest.items[2].fields[1];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemArg(field),
        'double? angle',
      );
    });

    test('method topMatchWrappedItemArgs', () {
      final manifest = manifest1Data;
      final item = manifest.items[2];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemArgs(item),
        '(double velocity, double? angle)',
      );
    });

    group('method topMatchWrappedGenericNNArg', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedGenericNNArg(item),
          'required R Function(double velocity, double? angle) windy',
        );
      });
    });

    group('method topMatchWrappedGenericNArg', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedGenericNArg(item),
          'R Function(double velocity, double? angle)? windy',
        );
      });
    });

    group('method topMatchWrappedVoidNNArg', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedVoidNNArg(item),
          'required void Function(double velocity, double? angle) windy',
        );
      });
    });

    group('method topMatchWrappedVoidNArg', () {
      test('null-safe', () {
        final manifest = manifest1Data;
        final item = manifest.items[2];
        final writer = TopMatchBaseWriter(manifest);

        expect(
          writer.topMatchWrappedVoidNArg(item),
          'void Function(double velocity, double? angle)? windy',
        );
      });
    });

    test('method topMatchWrappedItemCallArg', () {
      final manifest = manifest1Data;
      final field = manifest.items[2].fields[1];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemCallArg(field),
        'weather.angle',
      );
    });

    test('method topMatchWrappedItemCallArgs', () {
      final manifest = manifest1Data;
      final item = manifest.items[2];
      final writer = TopMatchBaseWriter(manifest);

      expect(
        writer.topMatchWrappedItemCallArgs(item),
        '(weather.velocity, weather.angle)',
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
    // end of group TopMatchBaseWriter
  });
}
