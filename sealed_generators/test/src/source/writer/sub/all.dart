import 'package:test/test.dart';

import 'test_sub_constructor_writer.dart' as test_sub_constructor_writer;
import 'test_sub_copy_writer.dart' as test_sub_copy_writer;
import 'test_sub_doc_writer.dart' as test_sub_doc_writer;
import 'test_sub_equatable_writer.dart' as test_sub_equatable_writer;
import 'test_sub_field_writer.dart' as test_sub_field_writer;
import 'test_sub_to_string_writer.dart' as test_sub_to_string_writer;
import 'test_sub_writer.dart' as test_sub_writer;

void main() {
  group('test_sub_constructor_writer', test_sub_constructor_writer.main);
  group('test_sub_copy_writer', test_sub_copy_writer.main);
  group('test_sub_doc_writer', test_sub_doc_writer.main);
  group('test_sub_equatable_writer', test_sub_equatable_writer.main);
  group('test_sub_field_writer', test_sub_field_writer.main);
  group('test_sub_to_string_writer', test_sub_to_string_writer.main);
  group('test_sub_writer', test_sub_writer.main);
}
