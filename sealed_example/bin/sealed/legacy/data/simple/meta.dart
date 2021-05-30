// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'meta.sealed.dart';

@Sealed()
@WithPrefix('Prefix')
abstract class _Weather {
  void sunny();

  @WithName('BadWeather')
  void rainy(int rain);

  @WithName('VeryBadWeather')
  @WithEquality(Equality.distinct)
  void windy(double velocity, double angle);
}
