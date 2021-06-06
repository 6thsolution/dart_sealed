// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'mixed.sealed.dart';

@Sealed()
abstract class _Apple {
  // note: you can omit type or use any type for banana
  void hold(@WithType('Banana?') void banana);
}

@Sealed()
abstract class _Banana {
  // note: you can omit type or use any type for apple
  void hold(@WithType('Apple') dynamic apple);
}

@Sealed()
abstract class _Coconut {
  void test1(@WithType('int') dynamic x, double y);

  void test2(@WithType('int?') double x, double y);

  // note: you can omit type or use any type for banana and apple
  void hold(
    @WithType('Apple?') dynamic apple,
    @WithType('Banana?') String banana,
  );
}
