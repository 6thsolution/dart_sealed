import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_complex.sealed.dart';

class Base {}

@Sealed()
abstract class _Result<D extends Object?, E extends Base> {
  void success(D data);

  void error(E exception);

  void dummy(D? data);

  void partialSuccess(D data, E? exception);

  void partialError(E? e, int code);

  void doubleSuccess(D data1, D data2, int code);
}
