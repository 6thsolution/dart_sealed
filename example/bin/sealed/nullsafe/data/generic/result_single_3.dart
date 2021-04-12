import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single_3.sealed.dart';

@Sealed()
abstract class _Result<D extends Object> {
  void success(D? data);

  void error(Object? exception);
}
