import 'package:test/test.dart';

import 'other/all.dart' as all_other;
import 'src/all.dart' as all_src;
import 'utils/all.dart' as all_utils;

void main() {
  group('other', all_other.main);
  group('src', all_src.main);
  group('utils', all_utils.main);
}
