// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:super_enum/super_enum.dart';

part 'weather_legacy.super.dart';

@superEnum
enum _Weather {
  @object
  Sunny,
  @Data(fields: [
    DataField<int>('rain'),
  ])
  Rainy,
  @Data(fields: [
    DataField<double>('velocity'),
    DataField<double>('angle'),
  ])
  Windy,
}
