import 'package:test/test.dart';

import 'exceptions/all.dart' as all_exceptions;
import 'manifest/all.dart' as all_manifest;
import 'options/all.dart' as all_options;
import 'source/all.dart' as all_source;
import 'utils/all.dart' as all_utils;

void main() {
  group('exceptions', all_exceptions.main);
  group('manifest', all_manifest.main);
  group('options', all_options.main);
  group('source', all_source.main);
  group('utils', all_utils.main);
}
