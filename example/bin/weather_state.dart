import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_state.sealed.dart';

@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
