import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// source writer
@sealed
@immutable
class SubEquatableWriter extends BaseUtilsWriter {
  const SubEquatableWriter(Source source) : super(source);

  @protected
  @visibleForTesting
  String fieldName(ManifestField field) => field.name;

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> subEquatableFieldNames(ManifestItem item) =>
      item.fields.map(fieldName);

  /// List<Object?> get props => [a, b, ...];
  @nonVirtual
  String subEquatableEquality(ManifestItem item) => [
        annotationOverride,
        [
          'List<Object$n>$nn get props => [',
          subEquatableFieldNames(item).joinArgsFull(),
          '];',
        ].joinParts(),
      ].joinLines();
}
