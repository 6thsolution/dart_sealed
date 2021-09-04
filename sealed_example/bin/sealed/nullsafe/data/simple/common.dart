import 'package:sealed_annotations/sealed_annotations.dart';

part 'common.sealed.dart';

@Sealed()
abstract class _ApiError {
  String get message;

  String? get code;

  void internetError();

  void badRequest();

  void internalError(Object? error);
}
