// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'wrap.sealed.dart';

@Sealed()
@WithWrap()
abstract class _Complete<T extends num, U extends Object> {
  void one();

  void two(T x, U y, U z);

  void three(int a, T b);
}
