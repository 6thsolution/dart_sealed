import 'package:meta/meta.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

/// utilities for type names
///
/// should not contain white space.
extension TypeUtils on String {
  @visibleForTesting
  bool isPrivate() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    return startsWith('_');
  }

  @visibleForTesting
  bool isPublic() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    return !startsWith('_');
  }

  /// is without any nullability signs.
  /// can be private or public.
  bool isGenTypeName() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    if (endsWith('?')) return false;
    if (endsWith('*')) return false;
    if (endsWith('/*!*/')) return false;
    if (endsWith('/*?*/')) return false;
    return true;
  }

  /// is generated type name.
  /// starts with lowercase letter.
  /// is public.
  bool isGenFieldName() {
    if (!isGenTypeName()) return false;
    if (!isPublic()) return false;
    if (!startsWithLower()) return false;
    return true;
  }

  /// is generated type name.
  /// starts with uppercase letter,
  /// is public.
  bool isGenClassName() {
    if (!isGenTypeName()) return false;
    if (!isPublic()) return false;
    if (!startsWithUpper()) return false;
    return true;
  }
}
