import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:super_enum/super_enum.dart';

part 'result_nullsafe.super.dart';

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
