import 'package:meta/meta.dart';
import 'package:sealed_writer/sealed_writer.dart';

/// write source
@sealed
@immutable
class Writer {
  static String _migration(String name) => '''// Migration guide for $name:
// For migration to dart_sealed, uncomment
// following generated manifest code, then
// replace it with your super_enum manifest
// then add dependencies to sealed_annotations
// and sealed_generators, then import 
// sealed_annotations instead of 
// super_enum_sealed_annotations, then change
// part file name from *.super.dart to
// *.sealed.dart, then rerun the build_runner.
// When you are done with migrating all sealed
// classes to dart_sealed, you can remove
// super_enum_sealed_annotations and
// super_enum_sealed_generators dependencies.
// ''';

  static const _ignore = '// ignore_for_file: unused_element, unused_field';

  const Writer();

  /// write
  String write(Source source) => [
        _ignore,
        _writeMigration(source),
        _writeSealed(source),
      ].joinMethods();

  /// sealed classes
  String _writeSealed(Source source) => SourceWriter(
        source,
        referenceManifest: false,
      ).write();

  /// migration guide
  String _writeMigration(Source source) => [
        _migration(source.manifest.name),
        BackwardWriter(source).write().splitLines().addComments().joinLines(),
      ].joinLines();
}
