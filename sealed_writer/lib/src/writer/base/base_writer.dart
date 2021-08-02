import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';

/// base writer
@immutable
abstract class BaseWriter {
  const BaseWriter(this.manifest);

  final Manifest manifest;
}
