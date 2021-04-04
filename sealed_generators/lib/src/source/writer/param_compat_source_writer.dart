import 'package:sealed_generators/src/source/source.dart';

/// generate temp classes for params
extension ParamCompatSourceWriter on Source {
  String writeParamCompat({bool debug = false}) {
    final s = StringBuffer();
    if (debug) {
      s.writeln('// ' + '*' * 74);
      s.writeln('// compat params generated code:');
      s.write('// language level: ');
      if (options.isNullSafe) {
        s.writeln('null-safe');
      } else {
        s.writeln('legacy');
      }
    }
    if (manifest.params.isNotEmpty) {
      for (final param in manifest.params) {
        s.writeln('class ${param.type.name} extends ${param.bound.name} {}');
      }
    } else {
      s.writeln('// no params identified.');
    }

    if (debug) {
      s.writeln('// ' + '*' * 74);
    }
    return s.toString();
  }
}
