import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../../../utils/examples.dart';

void main() {
  group('class SourceWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(writer.source, source);
    });

    test('method classes', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.classes(),
        containsAllInOrder([
          writer.topWriter.topClass(),
          ...writer.subWriter.subClasses(),
        ]),
      );
    });

    test('method write', () {
      final source = source1DataSafe;
      final writer = SourceWriter(source);

      expect(
        writer.write(),
        writer.classes().joinMethods(),
      );
    });
    // end of source writer test group
  });
}
