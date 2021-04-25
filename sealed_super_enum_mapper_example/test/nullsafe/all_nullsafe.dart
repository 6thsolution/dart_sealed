import 'package:test/test.dart';

import 'test_result.dart' as result_test;
import 'test_weather.dart' as weather_test;

void main() {
  group('result_test', result_test.main);
  group('weather_test', weather_test.main);
}
