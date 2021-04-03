import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

/// mimic original manifest code.
/// used only for debug and test.
extension BackwardSourceWriter on Source {
  String writeBackward({bool debug = false}) {
    final s = StringBuffer();
    if (debug) {
      s.writeln('// ' + '*' * 74);
      s.writeln('// backward generated code:');
      s.write('// language level: ');
      if (options.isNullSafe) {
        s.writeln('null-safe');
      } else {
        s.writeln('legacy');
      }
    }
    s.writeln('@Sealed(equality: ${options.equality})');
    if (debug) {
      s.writeln('// ignore: unused_element');
    }
    s.write('abstract class _${manifest.name}');
    if (debug) {
      // prevent clash with original manifest
      s.write(r'$');
    }
    s.writeln('{');
    s.writeln();
    for (final item in manifest.items) {
      s.write('void ${item.name.toLowerStart()}(');
      final fields = item.fields;
      for (var index = 0; index < fields.length; index++) {
        final field = fields[index];
        s.write(field.type.name);
        if (field.type.isNullable) {
          if (options.isNullSafe) {
            s.write('?');
          } else {
            s.write('/*?*/');
          }
        }
        s.write(' ${field.name}');
        if (index != fields.length - 1) {
          s.write(', ');
        } else if (index > 0) {
          s.write(',');
        }
      }
      s.writeln(');');
      s.writeln();
    }
    s.writeln('}');
    if (debug) {
      s.writeln('// ' + '*' * 74);
    }
    return s.toString();
  }
}
