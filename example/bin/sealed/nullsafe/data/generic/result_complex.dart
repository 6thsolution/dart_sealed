import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_complex.sealed.dart';

@Sealed()
abstract class _Result<D extends num, E extends Object> {
  void success(D data);

  void error(E exception);

  void mixed(D data, E exception);
}
