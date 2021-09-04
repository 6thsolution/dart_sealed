import 'package:sealed_annotations/sealed_annotations.dart';

part 'common_complex.sealed.dart';

@Sealed()
abstract class _Common {
  Object? get x;

  final String y = 'hello';

  void one(String x);

  void two(Object x);

  void three();

  void four(Object? x);
}
