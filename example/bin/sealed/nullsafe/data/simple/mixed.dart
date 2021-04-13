import 'package:sealed_annotations/sealed_annotations.dart';

part 'mixed.sealed.dart';

@Sealed()
abstract class _Apple {
  @SealedOverrideDynamic('Banana?')
  void hold(banana);
}

@Sealed()
abstract class _Banana {
  @SealedOverrideDynamic('Apple')
  void hold(apple);
}

@Sealed()
abstract class _Coconut {
  @SealedOverrideDynamic('int?')
  void test1(dynamic x, double y);

  @SealedOverrideNamed({
    'x': 'int',
  })
  void test2(double x, double y);

  @SealedOverrideDynamic('num')
  @SealedOverrideNamed({
    'apple': 'Apple?',
    'banana': 'Banana',
  })
  void hold(dynamic apple, dynamic? banana, int count, dynamic meta);
}