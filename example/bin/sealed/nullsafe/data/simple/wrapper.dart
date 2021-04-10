import 'package:sealed_annotations/sealed_annotations.dart';

part 'wrapper.sealed.dart';

@Sealed()
abstract class _Wrapper extends Object {
  void wrap(dynamic data);

  void wrapNullable(dynamic? data);
}
