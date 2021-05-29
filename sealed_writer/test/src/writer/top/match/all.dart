import 'package:test/test.dart';

import 'test_top_match_base_writer.dart' as test_top_match_base_writer;
import 'test_top_match_when_or_default_writer.dart'
    as test_top_match_when_or_default_writer;
import 'test_top_match_when_or_else_writer.dart'
    as test_top_match_when_or_else_writer;
import 'test_top_match_when_or_null_writer.dart'
    as test_top_match_when_or_null_writer;
import 'test_top_match_when_or_throw_writer.dart'
    as test_top_match_when_or_throw_writer;
import 'test_top_match_when_partial_writer.dart'
    as test_top_match_branch_partial_writer;
import 'test_top_match_when_writer.dart' as test_top_match_when_writer;
import 'test_top_match_writer.dart' as test_top_match_writer;

void main() {
  group('test_top_match_base_writer', test_top_match_base_writer.main);
  group('test_top_match_branch_partial_writer',
      test_top_match_branch_partial_writer.main);
  group('test_top_match_when_or_default_writer',
      test_top_match_when_or_default_writer.main);
  group('test_top_match_when_or_else_writer',
      test_top_match_when_or_else_writer.main);
  group('test_top_match_when_or_null_writer',
      test_top_match_when_or_null_writer.main);
  group('test_top_match_when_or_throw_writer',
      test_top_match_when_or_throw_writer.main);
  group('test_top_match_when_writer', test_top_match_when_writer.main);
  group('test_top_match_writer', test_top_match_writer.main);
}
