import 'package:test/test.dart';

import 'test_source.dart' as test_source;
import 'writer/all.dart' as all_writer;

void main() {
  group('writer', all_writer.main);
  group('test_source', test_source.main);
}
