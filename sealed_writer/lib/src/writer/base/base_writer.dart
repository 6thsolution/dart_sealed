import 'package:meta/meta.dart';
import 'package:sealed_writer/src/source/source.dart';

/// base writer
@immutable
abstract class BaseWriter {
  const BaseWriter(this.source);

  final Source source;
}
