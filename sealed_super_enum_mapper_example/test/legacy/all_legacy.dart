import 'package:test/test.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'test_result.dart' as result_test;
// ignore: import_of_legacy_library_into_null_safe
import 'test_weather.dart' as weather_test;

void main() {
  group('result_test', result_test.main);
  group('weather_test', weather_test.main);
}
