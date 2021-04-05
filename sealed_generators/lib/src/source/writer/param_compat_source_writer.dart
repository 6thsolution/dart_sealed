import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';

/// generate temp classes for params
/// todo remove this
class ParamCompatSourceWriter {
  ParamCompatSourceWriter({required this.source});

  final Source source;

  @visibleForTesting
  Options get opts => source.options;

  @visibleForTesting
  Manifest get man => source.manifest;

  String write({bool debug = false}) {
    final s = StringBuffer();
    if (debug) {
      s.writeln('// ' + '*' * 74);
      s.writeln('// compat params generated code:');
      s.write('// language level: ');
      if (opts.isNullSafe) {
        s.writeln('null-safe');
      } else {
        s.writeln('legacy');
      }
    }
    if (man.params.isNotEmpty) {
      for (final param in man.params) {
        s.write('/// nullable: ');
        s.writeln(param.bound.isNullable ? 'true' : 'false');
        s.writeln('class ${param.name} extends ${param.bound.name} {}');
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
