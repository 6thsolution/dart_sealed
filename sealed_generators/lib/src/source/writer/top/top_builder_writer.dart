import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_utils_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// top builder writer
@immutable
@sealed
class TopBuilderWriter extends BaseUtilsWriter {
  const TopBuilderWriter(Source source) : super(source);

  /// ex. angle: angle

  @nonVirtual
  @visibleForTesting
  String subConstructorCallArg(ManifestField field) =>
      '${field.name}: ${field.name}';

  /// ex. required double? angle

  @nonVirtual
  @visibleForTesting
  String topBuilderArg(ManifestField field) =>
      '$req ${typeSL(field.type)} ${field.name}';

  /// ex. static WeatherSunny sunny() => WeatherSunny();
  ///
  /// ex. static ResultSuccess<T> <T extends num>success(...) =>
  /// ResultSuccess<T>(...)
  @nonVirtual
  @visibleForTesting
  String topBuilder(ManifestItem item) => [
        annotationFactory,
        [
          'static ${subCall(item)}$nn ${subLower(item)}$genericDec',
          item.fields
              .map(topBuilderArg)
              .joinArgsFull()
              .withBracesOrNot()
              .withParenthesis(),
          ' => ${subCall(item)}',
          item.fields
              .map(subConstructorCallArg)
              .joinArgsFull()
              .withParenthesis(),
          ';',
        ].joinParts(),
      ].joinLines();

  @nonVirtual
  Iterable<String> topBuilderMethods() => manifest.items.map(topBuilder);
}
