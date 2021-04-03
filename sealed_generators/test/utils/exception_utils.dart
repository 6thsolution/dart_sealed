import 'package:meta/meta.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:test/test.dart';

Matcher hasMessage(dynamic matcher) => _HasMessage(matcher);

Matcher hasCause(dynamic matcher) => _HasCause(matcher);

Matcher isSealedException() => const TypeMatcher<SealedException>();

Matcher throwsAssertion() => throwsA(const TypeMatcher<AssertionError>());

@sealed
class _HasMessage extends CustomMatcher {
  _HasMessage(dynamic matcher)
      : super('SealedException with message that is', 'message', matcher);

  @override
  String? featureValueOf(dynamic actual) => (actual as SealedException).message;
}

@sealed
class _HasCause extends CustomMatcher {
  _HasCause(dynamic matcher)
      : super('SealedException with cause that is', 'cause', matcher);

  @override
  Object? featureValueOf(dynamic actual) => (actual as SealedException).cause;
}
