import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single_empty.sealed.dart';

@Sealed()
abstract class _Result<D extends Object> {
  void success(D data);

  void empty();

  void error(int code);
}
