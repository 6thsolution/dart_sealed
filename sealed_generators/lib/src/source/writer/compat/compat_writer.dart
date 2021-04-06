import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// generate classes for params
/// todo remove this
@sealed
@immutable
class CompatWriter extends BaseWriter {
  const CompatWriter(Source source) : super(source);

  String write() => source.manifest.params.map(_paramClass).joinMethods();

  String _paramClass(ManifestParam param) =>
      'class ${param.name} extends ${param.bound.name} {}';
}
