import 'package:sealed_generators/src/exceptions/exceptions.dart';

/// utilities for type and variable names
///
/// should not start with "_".
extension NameUtils on String {
  /// should not start with "_".
  bool startsWithUpper() {
    check(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    check(first != '_');
    final upperFirst = first.toUpperCase();
    return first == upperFirst;
  }

  /// should not start with "_".
  bool startsWithLower() {
    check(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    check(first != '_');
    final lowerFirst = first.toLowerCase();
    return first == lowerFirst;
  }

  /// should not start with "_".
  String toUpperStart() {
    check(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    check(first != '_');
    final upperFirst = first.toUpperCase();
    check(upperFirst != first);
    final second = substring(1);
    return upperFirst + second;
  }

  /// should not start with "_".
  String toLowerStart() {
    check(isNotEmpty && trim() == this && !contains(' '));
    final first = substring(0, 1);
    check(first != '_');
    final lowerFirst = first.toLowerCase();
    check(lowerFirst != first);
    final second = substring(1);
    return lowerFirst + second;
  }
}
