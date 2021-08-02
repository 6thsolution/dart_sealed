import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/source_writer.dart';
import 'package:test/test.dart';

import '../../utils/examples.dart';

void main() {
  group('class SourceWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = SourceWriter(manifest);

      expect(writer.manifest, manifest);
    });

    test('method classes', () {
      final manifest = manifest1Data;
      final writer = SourceWriter(manifest);

      expect(
        writer.classes(),
        containsAllInOrder(<String>[
          writer.topWriter.topClass(),
          ...writer.subWriter.subClasses(),
        ]),
      );
    });

    test('method write', () {
      final manifest = manifest1Data;
      final writer = SourceWriter(manifest);

      expect(
        writer.write(),
        writer.classes().joinMethods(),
      );
    });
    // end of group SourceWriter
  });
}
