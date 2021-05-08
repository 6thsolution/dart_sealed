import 'package:test/test.dart';

import 'backward/all.dart' as all_backward;
import 'base/all.dart' as all_base;
import 'sub/all.dart' as all_sub;
import 'test_source_writer.dart' as test_source_writer;
import 'top/all.dart' as all_top;

void main() {
  group('backward', all_backward.main);
  group('base', all_base.main);
  group('sub', all_sub.main);
  group('top', all_top.main);
  group('test_source_writer', test_source_writer.main);
}
