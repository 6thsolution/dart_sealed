import 'package:sealed_writer/src/manifest/manifest.dart';

/// base writer
abstract class BaseWriter {
  const BaseWriter(this.manifest);

  final Manifest manifest;
}
