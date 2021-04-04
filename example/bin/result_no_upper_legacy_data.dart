// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_no_upper_legacy_data.sealed.dart';

@Sealed()
abstract class _Result<D, E> {
  void success(D data);

  void error(E exception);
}
