import 'package:sealed_annotations/sealed_annotations.dart';

part 'functional.sealed.dart';

typedef Func = int Function(double x);

typedef FuncN = int Function(double x)?;

@Sealed()
abstract class _Functional1 {
  void one(Func x);

  void two(Func? x);

  void three(FuncN x);
}

@Sealed()
abstract class _Functional2 {
  void one(int Function(double x) x);

  void two(int Function(double x)? x);
}

@Sealed()
abstract class _Functional3 {
  void one(@WithType('Func') dynamic x);

  void two(@WithType('Func?') dynamic x);

  void three(@WithType('FuncN') dynamic x);

  void four(@WithType('int Function(double x)') dynamic x);

  void five(@WithType('int Function(double x)?') dynamic x);
}
