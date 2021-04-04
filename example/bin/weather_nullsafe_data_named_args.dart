import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_nullsafe_data_named_args.sealed.dart';

@Sealed()
abstract class _Weather {
  void sunny();

  void rainy({int rain});

  void windy(double velocity, {required double? angle});
}
