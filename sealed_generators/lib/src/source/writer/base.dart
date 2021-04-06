import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/source/source.dart';

/// base writer utilities
@immutable
abstract class BaseWriter {
  const BaseWriter(this.source);

  final Source source;
}
