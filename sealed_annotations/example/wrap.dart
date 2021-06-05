import 'package:sealed_annotations/sealed_annotations.dart';

part 'wrap.sealed.dart';

@Sealed()
@WithWrap()
abstract class _Complete {
  void one();

  void two(int x);

  void three(double y, double? z);
}

@Sealed()
abstract class _Partial {
  void one();

  void two(int x);

  @WithWrap()
  void three(double y, double? z);
}
