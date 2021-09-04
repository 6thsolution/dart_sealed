import 'package:sealed_writer/src/writer/top/top_common_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class CommonWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopCommonWriter(manifest);

      expect(writer.manifest, manifest);
    });

    test('method topCommonGetter', () {
      final manifest = manifest3Data;
      final writer = TopCommonWriter(manifest);
      final field1 = manifest.fields[0];

      expect(
        writer.topCommonGetter(field1),
        'num get x;',
      );
    });

    group('method topCommonGetters', () {
      test('non-empty', () {
        final manifest = manifest3Data;
        final writer = TopCommonWriter(manifest);

        expect(
          writer.topCommonGetters(),
          contains('num get x;'),
        );
      });

      test('empty', () {
        final manifest = manifest1Data;
        final writer = TopCommonWriter(manifest);

        expect(writer.topCommonGetters(), isEmpty);
      });
    });
  });
}
