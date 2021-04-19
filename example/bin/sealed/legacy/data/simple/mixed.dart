// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'mixed.sealed.dart';

@Sealed()
abstract class _Apple {
  void hold(@WithType('Banana?') banana);
}

@Sealed()
abstract class _Banana {
  void hold(@WithType('Apple') apple);
}

@Sealed()
abstract class _Coconut {
  void test1(@WithType('int') dynamic x, double y);

  void test2(@WithType('int?') double x, double y);

  void hold(@WithType('Apple?') apple, @WithType('Banana?') banana);
}
