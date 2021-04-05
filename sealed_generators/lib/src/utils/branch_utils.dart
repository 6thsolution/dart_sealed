import 'package:meta/meta.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

class Branch {
  const Branch({
    required this.ifs,
    this.els,
  }) : assert(ifs.length != 0);

  final List<If> ifs;
  final Else? els;

  /// if (condition) {code}
  @visibleForTesting
  static String mapIf(If i) => 'if (${i.condition}) {${i.code}}';

  /// else if (condition) {code}
  @visibleForTesting
  static String mapElseIf(If i) => 'else ${mapIf(i)}';

  /// else {code}
  @visibleForTesting
  static String mapElse(Else e) => 'else {${e.code}}';

  /// if (cnd1) {code1}
  ///
  /// else if(cnd2) {code2}
  ///
  /// else {code3}
  String join() => [
        mapIf(ifs.first),
        ...ifs.skip(1).map(mapElseIf),
        if (els != null) mapElse(els!),
      ].joinLines();

  @override
  String toString() => 'Branch{ifs: $ifs, else: $els}';
}

@immutable
@sealed
class If {
  If({
    required this.condition,
    required this.code,
  });

  final String condition;
  final String code;

  @override
  String toString() => 'if(condition){$code}';
}

@immutable
@sealed
class Else {
  Else({
    required this.code,
  });

  final String code;

  @override
  String toString() => 'else{$code}';
}
