import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single_1.sealed.dart';

@Sealed()
abstract class _Result<D extends num> {
  void success(D data);

  void error(Object exception);
}
