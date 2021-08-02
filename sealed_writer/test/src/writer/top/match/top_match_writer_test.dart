import 'package:sealed_writer/src/writer/top/match/top_match_writer.dart';
import 'package:test/test.dart';

import '../../../../utils/examples.dart';

void main() {
  group('class TopMatchWriter', () {
    test('initialization', () {
      final manifest = manifest1Data;
      final writer = TopMatchWriter(manifest);

      expect(writer.manifest, manifest);
    });

    test('method topMatchMethods', () {
      final manifest = manifest1Data;
      final writer = TopMatchWriter(manifest);

      expect(
        writer.topMatchMethods(),
        containsAll(<String>[
          writer.topMatchWhenWriter.topMatchWhen(),
          writer.topMatchMaybeWhenWriter.topMatchMaybeWhen(),
          writer.topMatchPartialWhenWriter.topMatchPartialWhen(),
        ]),
      );
    });
    // end of group TopMatchWriter
  });
}
