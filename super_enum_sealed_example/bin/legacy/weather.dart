// @dart=2.9
import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';

part 'weather.super.dart';

// ignore_for_file: unused_element, unused_field

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
    DataField<double>('angle', required: false),
  ])
  Windy,
}
