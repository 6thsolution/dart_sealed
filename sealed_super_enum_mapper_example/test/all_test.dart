import 'package:test/test.dart';

import 'legacy/all_legacy.dart' as legacy;
import 'nullsafe/all_nullsafe.dart' as nullsafe;

void main() {
  group('legacy', legacy.main);
  group('nullsafe', nullsafe.main);
}
