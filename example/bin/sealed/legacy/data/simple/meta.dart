// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'meta.sealed.dart';

@Sealed()
abstract class _Weather {
  void sunny();

  @Meta(name: 'BadWeather')
  void rainy(int rain);

  @Meta(name: 'VeryBadWeather', equality: Equality.distinct)
  void windy(double velocity, double angle);
}
