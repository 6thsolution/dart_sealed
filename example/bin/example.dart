import 'sealed/nullsafe/data/simple/weather.dart';

void main() {
  print('Hello, world!');
  final a = Weather.sunny();
  final b = Weather.rainy(rain: 12);
  final c = Weather.windy(velocity: 1.5, angle: null);
  print(a);
  print(b);
  print(c);

  final x = a.when(
    sunny: (sunny) => '1',
    rainy: (rainy) => '2',
    windy: (windy) => '3',
  );
  assert(x is String);
  assert(x.length == 1);

  final y = a.when(
    sunny: (sunny) => null,
    rainy: (rainy) => '2',
    windy: (windy) => '3',
  );
  assert(y is String?);
  assert(y is! String);

  final z = a.whenOrElse(
    rainy: (rainy) => '2',
    orElse: (weather) => '? $weather',
  );
  assert(z is String);

  final a1 = a.copy();
  final b1 = b.copy(rain: 1);
  print(a1);
  print(b1);
}
