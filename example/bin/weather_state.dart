import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_state.sealed.dart';

@Sealed(equality: SealedEquality.data)
abstract class _WeatherState {
  void sunny();

  void rainy(double rain);

  void windy(double? angle);
}
