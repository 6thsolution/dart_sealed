import 'package:sealed_annotations/sealed_annotations.dart';

part 'mixed_nullsafe_data.sealed.dart';

@Sealed()
abstract class _Apple {
  void hold(Banana banana);
}

@Sealed()
abstract class _Banana {
  void hold(dynamic apple);
}

@Sealed()
abstract class _Coconut {
  void hold(dynamic apple, dynamic banana);
}
