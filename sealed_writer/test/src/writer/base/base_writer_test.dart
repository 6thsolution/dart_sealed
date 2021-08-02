import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

class _Writer extends BaseWriter {
  const _Writer(Manifest manifest) : super(manifest);
}

void main() {
  group('class BaseWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = _Writer(manifest);

      expect(writer.manifest, manifest);
    });
    // end of group BaseWriter
  });
}
