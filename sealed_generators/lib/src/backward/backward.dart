import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

/// only for debug
extension Backward on Source {
  String backward() {
    final s = StringBuffer();
    s.writeln('// ' + '*' * 64);
    s.writeln('// backward generated code');
    s.write('// language level: ');
    s.writeln(options.isNullSafe ? 'nullSafe' : 'legacy');
    s.writeln('@Sealed(equality: ${options.equality})');
    s.writeln('abstract class _${manifest.name}\${');
    s.writeln();
    for (final item in manifest.items) {
      s.write('void ${item.name.toLowerStart()}(');
      for (var field in item.fields) {
        s.write('${field.type} ${field.name},');
      }
      s.writeln(');');
      s.writeln();
    }
    s.writeln('}');
    s.writeln('// ' + '*' * 64);
    return s.toString();
  }
}
