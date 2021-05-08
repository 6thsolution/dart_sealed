import 'package:test/test.dart';

Type typeOf<T>() => T;

Matcher hasType<T>() => _HasType(typeOf<T>());

class _HasType extends CustomMatcher {
  _HasType(Type type)
      : super(
          'with runtimeType that is',
          'runtimeType',
          equals(type),
        );

  @override
  Type featureValueOf(Object? actual) => actual.runtimeType;
}
