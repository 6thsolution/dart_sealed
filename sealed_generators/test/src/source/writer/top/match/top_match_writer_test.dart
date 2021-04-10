import 'package:sealed_generators/src/source/writer/top/match/top_match_writer.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TopMatchWriter', () {
    test('initialization', () {
      final source = source1DataSafe;
      final writer = TopMatchWriter(source);

      expect(writer.source, source);
    });

    test('method topMatchMethods', () {
      final source = source1DataLegacy;
      final writer = TopMatchWriter(source);

      expect(
        writer.topMatchMethods(),
        containsAllInOrder([
          writer.topMatchWhenWriter.topMatchWhen(),
          writer.topMatchWhenOrElseWriter.topMatchWhenOrElse(),
        ]),
      );
    });
    // end of group TopMatchWriter
  });
}
