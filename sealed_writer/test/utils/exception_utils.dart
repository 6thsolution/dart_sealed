import 'package:meta/meta.dart';
import 'package:sealed_writer/src/exceptions/exceptions.dart';
import 'package:test/test.dart';

Matcher hasMessage(dynamic matcher) => _HasMessage(matcher);

Matcher hasCause(dynamic matcher) => _HasCause(matcher);

Matcher throwsSealedErrorNotInternal({
  Matcher message = anything,
  Matcher cause = anything,
}) =>
    throwsA(allOf(
      isSealedError(),
      isNot(isInternalSealedError()),
      hasMessage(message),
      hasCause(cause),
    ));

Matcher throwsSealedError({
  Matcher message = anything,
  Matcher cause = anything,
}) =>
    throwsA(allOf(
      isSealedError(),
      hasMessage(message),
      hasCause(cause),
    ));

Matcher isSealedError() => const TypeMatcher<SealedError>();

Matcher isInternalSealedError() => const TypeMatcher<InternalSealedError>();

Matcher throwsInternal() => throwsA(isInternalSealedError());

/// delegate and log
Matcher logging(Matcher matcher) => _Logging(matcher);

@sealed
class _HasMessage extends CustomMatcher {
  _HasMessage(dynamic matcher)
      : super('SealedError with message that is', 'message', matcher);

  @override
  Object? featureValueOf(dynamic actual) => (actual as SealedError).message;
}

@sealed
class _HasCause extends CustomMatcher {
  _HasCause(dynamic matcher)
      : super('SealedError with cause that is', 'cause', matcher);

  @override
  Object? featureValueOf(dynamic actual) => (actual as SealedError).cause;
}

/// delegate and log
@sealed
class _Logging implements Matcher {
  final Matcher matcher;

  const _Logging(this.matcher);

  @override
  Description describe(Description description) =>
      matcher.describe(description);

  @override
  Description describeMismatch(
    item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) =>
      matcher.describeMismatch(
        item,
        mismatchDescription,
        matchState,
        verbose,
      );

  @override
  bool matches(item, Map<dynamic, dynamic> matchState) {
    print(item);

    return matcher.matches(item, matchState);
  }
}
