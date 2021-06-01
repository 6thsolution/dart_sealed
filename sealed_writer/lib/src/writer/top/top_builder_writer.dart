import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top builder writer
@immutable
@sealed
class TopBuilderWriter extends BaseUtilsWriter {
  const TopBuilderWriter(Source source) : super(source);

  /// ex. angle: angle
  String subConstructorCallArg(ManifestField field) =>
      '${field.name}: ${field.name}';

  /// ex. required double? angle
  String topBuilderArg(ManifestField field) =>
      '$req ${typeSL(field.type)} ${field.name}';

  /// ex. static WeatherSunny sunny() => WeatherSunny();
  ///
  /// ex. static ResultSuccess<T> <T extends num>success(...) =>
  /// ResultSuccess<T>(...)
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

  Iterable<String> topBuilderMethods() => manifest.items.map(topBuilder);
}
