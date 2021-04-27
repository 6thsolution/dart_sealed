import 'package:test/test.dart';

import 'test_branch_utils.dart' as test_branch_utils;
import 'test_list_equality_utils.dart' as test_list_equality_utils;
import 'test_list_utils.dart' as test_list_utils;
import 'test_name_utils.dart' as test_name_utils;
import 'test_string_utils.dart' as test_string_utils;
import 'test_type_utils.dart' as test_type_utils;

void main() {
  group('test_branch_utils', test_branch_utils.main);
  group('test_list_equality_utils', test_list_equality_utils.main);
  group('test_list_utils', test_list_utils.main);
  group('test_name_utils', test_name_utils.main);
  group('test_string_utils', test_string_utils.main);
  group('test_type_utils', test_type_utils.main);
}
