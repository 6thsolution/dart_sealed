import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/source_writer.dart';
import 'package:test/test.dart';

import '../../utils/examples.dart';

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
        containsAllInOrder(<String>[
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
    // end of group SourceWriter
  });
}
