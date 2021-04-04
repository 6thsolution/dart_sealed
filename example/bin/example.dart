import 'weather_nullsafe_data.dart';

void main() {
  print('Hello, world!');
  final a = Weather.sunny();
  final b = Weather.rainy(rain: 12);
  final c = Weather.windy(velocity: 1.5, angle: null);
  print(a);
  print(b);
  print(c);
}
