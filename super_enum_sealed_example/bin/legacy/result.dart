// @dart=2.9
import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';

part 'result.super.dart';

// ignore_for_file: unused_element, unused_field

@superEnum
enum _Result {
  @generic
  @Data(fields: [
    DataField<Generic>('data'),
  ])
  Success,
  @Data(fields: [
    DataField<Object>('exception'),
  ])
  Error,
}
