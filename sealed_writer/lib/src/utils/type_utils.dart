import 'package:sealed_writer/src/exceptions/exceptions.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/name_utils.dart';

/// utilities for type names
///
/// should not contain white space.
extension TypeUtils on String {
  /// starts with '_'
  bool isPrivate() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    return startsWith('_');
  }

  /// not starts with '_'
  bool isPublic() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    return !startsWith('_');
  }

  /// is without any nullability signs.
  /// can be private or public.
  bool isGenTypeName() {
    if (isEmpty || trim() != this || contains(' ')) return false;
    if (endsWith('?')) return false;
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

  /// can be any thing with/without nullability sign.
  ///
  /// can be functional type or alias type name or ...
  bool isExternalTypeName() {
    if (isEmpty || trim() != this || '?' == this) return false;
    return true;
  }

  /// like isExternalTypeName but disallow nullable types
  bool isExternalNonNullableTypeName() {
    if (!isExternalTypeName()) return false;
    if (endsWith('?')) return false;
    return true;
  }

  /// read non-null or nullable type.
  /// for example: double or double?.
  ManifestType readType() {
    check(isExternalTypeName());
    return endsWith('?')
        ? ManifestType(name: substring(0, length - 1), isNullable: true)
        : ManifestType(name: this, isNullable: false);
  }
}
