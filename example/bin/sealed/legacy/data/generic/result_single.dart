// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single.sealed.dart';

@Sealed()
abstract class _Result<D extends num> {
  void success(D data);

  void error(Object exception);
}
