// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_legacy_distinct.sealed.dart';

@Sealed(equality: SealedEquality.distinct)
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double angle);
}
