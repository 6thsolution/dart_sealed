import 'package:sealed_writer/src/exceptions/exceptions.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';

class Branch {
  Branch({
    required this.ifs,
    this.els,
  }) {
    check(ifs.isNotEmpty);
  }

  final List<If> ifs;
  final Else? els;

  /// if (condition) {code}
  static String mapIf(If i) => 'if (${i.condition}) {${i.code}}';

  /// else if (condition) {code}
  static String mapElseIf(If i) => 'else ${mapIf(i)}';

  /// else {code}
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

class If {
  const If({
    required this.condition,
    required this.code,
  });

  final String condition;
  final String code;

  @override
  String toString() => 'if($condition){$code}';
}

class Else {
  const Else({
    required this.code,
  });

  final String code;

  @override
  String toString() => 'else{$code}';
}
