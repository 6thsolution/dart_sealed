// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'weather_named_args.sealed.dart';

@Sealed()
abstract class _Weather {
  void sunny();

  void rainy({int rain});

  void windy(double velocity, {@required double angle});
}
