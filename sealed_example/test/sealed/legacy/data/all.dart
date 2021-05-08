// @dart=2.9
import 'package:test/test.dart';

import 'generic/all.dart' as all_generic;
import 'simple/all.dart' as all_simple;

void main() {
  group('generic', all_generic.main);
  group('simple', all_simple.main);
}
