import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_writer/sealed_writer.dart';

/// write source
@sealed
@immutable
class Writer {
  const Writer();

  /// write source
  String write(Source source) => [
        '// ignore_for_file: unused_element, unused_field',
        [
          r'/// substitute generated manifest for super enum',
          r'/// and remove "$" at the end of class name.',
          BackwardWriter(source).write(),
        ].joinLines(),
        SourceWriter(source).write(),
      ].joinMethods();
}
