// @dart=2.9
import 'package:test/test.dart';

import 'data/all.dart' as all_data;
import 'distinct/all.dart' as all_distinct;
import 'identity/all.dart' as all_identity;

void main() {
  group('data', all_data.main);
  group('distinct', all_distinct.main);
  group('identity', all_identity.main);
}
