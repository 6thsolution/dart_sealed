import 'package:sealed_annotations/sealed_annotations.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:super_enum/super_enum.dart';

part 'use_class_nullsafe.super.dart';

// ignore_for_file: unused_element, unused_field

@superEnum
enum _Weather {
  @object
  Sunny,
  @UseClass(Object, name: 'Lollipop')
  Rainy,
}
