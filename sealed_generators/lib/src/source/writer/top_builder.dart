import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// top builder writer
@immutable
@sealed
class TopBuilderWriter extends BaseUtilsWriter {
  const TopBuilderWriter(Source source) : super(source);

  /// ex. angle: angle
  @protected
  @nonVirtual
  @visibleForTesting
  String subConstructorCallArg(ManifestField field) =>
      '${field.name}: ${field.name}';

  /// ex. required double? angle
  @protected
  @nonVirtual
  @visibleForTesting
  String topBuilderArg(ManifestField field) =>
      '$req ${typeSL(field.type)} ${field.name}';

  /// ex. static ... rainy() => ...
  @protected
  @nonVirtual
  @visibleForTesting
  String topBuilder(ManifestItem item) => [
        annotationFactory,
        [
          'static ${subFull(item)}$nn ${subLower(item)}',
          item.fields
              .map(topBuilderArg)
              .joinArgs()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${subFull(item)}',
          item.fields.map(subConstructorCallArg).joinArgs().withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();

  @protected
  @nonVirtual
  @visibleForTesting
  Iterable<String> topBuilderMethods() => manifest.items.map(topBuilder);
}
