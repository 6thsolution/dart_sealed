import 'package:meta/meta.dart';

/// message should be `null`, `String` or `String Function()`
void require(final bool value, [final dynamic message]) {
  if (!value) {
    String? m;
    if (message is String?) {
      m = message;
    } else if (message is String Function()) {
      m = message();
    } else {
      throw InternalSealedError('message type is invalid');
    }
    throw SealedError(m);
  }
}

/// assert will be removed in production
///
/// these should not happen even with malformed manifest.
/// this is only for checking internal code flow and logic.
void check(final bool value) {
  if (!value) throw InternalSealedError('check failed');
}

/// sealed error
@immutable
class SealedError extends Error {
  final Object? message;
  final Object? cause;

  SealedError([this.message, this.cause]);

  @override
  String toString() {
    final s = StringBuffer('SealedError{');
    if (message != null) {
      s.write('message={$message}');
    }
    if (cause != null) {
      s.write(',cause={$cause}');
    }
    s.write('}');
    return Error.safeToString(s.toString());
  }
}

/// internal sealed error
///
/// for when errors which should not happen
/// even in a malformed manifest happens.
class InternalSealedError extends SealedError {
  InternalSealedError([Object? cause]) : super('internal error', cause);
}
