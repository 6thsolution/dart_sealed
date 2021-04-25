import 'package:test/test.dart';

import 'legacy/all.dart' as all_legacy;
import 'nullsafe/all.dart' as all_nullsafe;

void main() {
  group('legacy', all_legacy.main);
  group('nullsafe', all_nullsafe.main);
}
