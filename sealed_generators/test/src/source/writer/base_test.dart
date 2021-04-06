import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

class _Writer extends BaseWriter {
  const _Writer(Source source) : super(source);
}

void main() {
  group('class BaseWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = _Writer(source);

      expect(writer.source, source);
    });
    // end of group BaseWriter
  });
}
