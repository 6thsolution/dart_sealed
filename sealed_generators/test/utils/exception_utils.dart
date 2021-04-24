import 'package:meta/meta.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:test/test.dart';

Matcher hasMessage(dynamic matcher) => _HasMessage(matcher);

Matcher hasCause(dynamic matcher) => _HasCause(matcher);

Matcher isSealedError() => const TypeMatcher<SealedError>();

Matcher isInternalSealedError() => const TypeMatcher<InternalSealedError>();

Matcher throwsInternal() => throwsA(isInternalSealedError());

@sealed
class _HasMessage extends CustomMatcher {
  _HasMessage(dynamic matcher)
      : super('SealedError with message that is', 'message', matcher);

  @override
  String? featureValueOf(dynamic actual) => (actual as SealedError).message;
}

@sealed
class _HasCause extends CustomMatcher {
  _HasCause(dynamic matcher)
      : super('SealedError with cause that is', 'cause', matcher);

  @override
  Object? featureValueOf(dynamic actual) => (actual as SealedError).cause;
}
