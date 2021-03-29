import 'package:meta/meta.dart';

void require(final bool value, [final String? message]) {
  if (!value) {
    throw SealedException(message);
  }
}

void requireLate(final bool value, final String Function() message) {
  if (!value) {
    throw SealedException(message());
  }
}

@sealed
class SealedException {
  final String? message;
  final Object? cause;

  const SealedException([this.message, this.cause]);

  @override
  String toString() {
    var s = 'SealedException';

    if (message == null) {
      s = '$s(unknown';
    } else {
      s = '$s($message';
    }

    if (cause != null) {
      s = '$s, cause=$cause';
    }

    s = '$s)';

    return s;
  }
}
