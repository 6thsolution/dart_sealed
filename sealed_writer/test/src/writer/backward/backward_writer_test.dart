import 'package:sealed_writer/src/writer/backward/backward_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class BackwardWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = BackwardWriter(manifest);

      expect(writer.manifest, manifest);
    });

    group('method write', () {
      test('data equality', () {
        final manifest = manifest1Data;
        final writer = BackwardWriter(manifest);

        expect(writer.write(), code1Data);
      });

      test('identity equality', () {
        final manifest = manifest1Identity;
        final writer = BackwardWriter(manifest);

        expect(writer.write(), code1Identity);
      });

      test('distinct equality', () {
        final manifest = manifest1Distinct;
        final writer = BackwardWriter(manifest);

        expect(writer.write(), code1Distinct);
      });

      test('data equality generic', () {
        final manifest = manifest2Data;
        final writer = BackwardWriter(manifest);

        expect(writer.write(), code2Data);
      });

      test('data equality common', () {
        final manifest = manifest3Data;
        final writer = BackwardWriter(manifest);

        expect(writer.write(), code3Data);
      });
    });
  });
}
