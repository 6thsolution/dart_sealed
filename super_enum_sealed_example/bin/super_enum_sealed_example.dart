import 'nullsafe/result.dart';
import 'nullsafe/weather.dart';

void main() {
  final a = Weather.sunny();
  final b = Weather.rainy(rain: 12);
  final c = Weather.windy(velocity: 1.5, angle: null);

  print(a);
  print(b);
  print(c);

  final d = Result.success(data: 1);
  final e = Result.success(data: 5.6);
  final f = Result.error(exception: 'error');

  print(d);
  print(e);
  print(f);
}
