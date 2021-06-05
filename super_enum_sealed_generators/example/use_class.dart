import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';

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
