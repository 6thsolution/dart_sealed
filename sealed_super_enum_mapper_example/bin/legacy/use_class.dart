// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:super_enum/super_enum.dart';

part 'use_class.super.dart';

// ignore_for_file: unused_element, unused_field

class Hello {}

@superEnum
enum _Weather {
  @object
  Sunny,
  @UseClass(Hello, name: 'Lollipop')
  Rainy,
}
