import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

/// mimic original manifest code.
/// used only for debug and test.
class BackwardSourceWriter {
  BackwardSourceWriter(this.source);

  final Source source;

  @visibleForTesting
  Options get opts => source.options;

  @visibleForTesting
  Manifest get man => source.manifest;

  String write({bool debug = false}) {
    final s = StringBuffer();
    if (debug) {
      s.writeln('// ' + '*' * 74);
      s.writeln('// backward generated code:');
      s.write('// language level: ');
      if (opts.isNullSafe) {
        s.writeln('null-safe');
      } else {
        s.writeln('legacy');
      }
    }
    s.writeln('@Sealed(equality: ${opts.equality})');
    if (debug) {
      s.writeln('// ignore: unused_element');
    }
    s.write('abstract class _${man.name}');
    if (debug) {
      // prevent clash with original manifest
      s.write(r'$');
    }
    final params = man.params;
    if (params.isNotEmpty) {
      s.write('<');
      s.write(
        params.map((param) {
          final s = param.name + ' extends ' + param.bound.name;
          if (opts.isNullSafe) {
            return s + (param.bound.isNullable ? '?' : '');
          } else {
            return s + (param.bound.isNullable ? '/*?*/' : '/*!*/');
          }
        }).join(', '),
      );
      s.write('>');
    }
    s.writeln('{');
    s.writeln();
    for (final item in man.items) {
      s.write('void ${item.name.toLowerStart()}(');
      final fields = item.fields;
      for (var index = 0; index < fields.length; index++) {
        final field = fields[index];
        s.write(field.type.name);
        if (field.type.isNullable) {
          if (opts.isNullSafe) {
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
