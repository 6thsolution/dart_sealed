import 'package:test/test.dart';

import 'match/all.dart' as all_match;
import 'test_top_builder_writer.dart' as test_top_builder_writer;
import 'test_top_cast_writer.dart' as test_top_cast_writer;
import 'test_top_doc_writer.dart' as test_top_doc_writer;
import 'test_top_writer.dart' as test_top_writer;

void main() {
  group('match', all_match.main);
  group('test_top_builder_writer', test_top_builder_writer.main);
  group('test_top_cast_writer', test_top_cast_writer.main);
  group('test_top_doc_writer', test_top_doc_writer.main);
  group('test_top_writer', test_top_writer.main);
}
