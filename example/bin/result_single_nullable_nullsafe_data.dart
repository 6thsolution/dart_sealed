import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_single_nullable_nullsafe_data.sealed.dart';

@Sealed()
abstract class _Result<D extends Object?> {
  void success(D data);

  void error(dynamic exception, int code);
}
