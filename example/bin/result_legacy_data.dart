// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_legacy_data.sealed.dart';

class Base {}

@Sealed()
abstract class _Result<D extends Object, E extends Base> {
  void success(D data);

  void error(E exception);
}
