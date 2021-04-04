// @dart=2.9
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single_nullable_legacy_data.sealed.dart';

@Sealed()
abstract class _Result<D extends Object> {
  void success(D data);

  void error(dynamic exception, int code);
}
