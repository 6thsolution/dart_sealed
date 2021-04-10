import 'package:sealed_annotations/sealed_annotations.dart';

part 'mixed.sealed.dart';

@Sealed()
abstract class _Apple {
  @SealedTypeOverride.allDynamic(SealedType.nonNull('Banana'))
  void hold(Banana banana);
}

@Sealed()
abstract class _Banana {
  @SealedTypeOverride.allDynamic(SealedType.nullable('Apple'))
  void hold(dynamic apple);
}

@Sealed()
abstract class _Coconut {
  @SealedTypeOverride.allDynamic(SealedType.nullable('int'))
  void test1(dynamic x, double y);

  @SealedTypeOverride.named({
    'x': SealedType.nonNull('int'),
  })
  void test2(double x, double y);

  @SealedTypeOverride.named({
    'apple': SealedType.nullable('Apple'),
    'banana': SealedType.nullable('Banana'),
  })
  void hold(dynamic apple, dynamic banana, int count);
}
