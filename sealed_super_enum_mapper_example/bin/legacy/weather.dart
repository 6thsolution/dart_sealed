// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:super_enum/super_enum.dart';

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
    DataField<double>('angle'),
  ])
  Windy,
}
