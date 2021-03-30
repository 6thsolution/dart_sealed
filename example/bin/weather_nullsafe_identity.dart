import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_nullsafe_identity.sealed.dart';

@Sealed(equality: SealedEquality.identity)
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
