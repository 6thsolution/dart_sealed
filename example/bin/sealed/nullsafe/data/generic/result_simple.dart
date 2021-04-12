import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_simple.sealed.dart';

class DBase {}

class EBase {}

@Sealed()
abstract class _Result<D extends DBase, E extends EBase> {
  void success(D data);

  void error(E exception);
}
