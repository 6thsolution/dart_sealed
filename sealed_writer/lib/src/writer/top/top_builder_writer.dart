import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top builder writer
@immutable
@sealed
class TopBuilderWriter extends BaseUtilsWriter {
  const TopBuilderWriter(Manifest manifest) : super(manifest);

  /// ex. required double? angle
  String topBuilderDecArg(ManifestField field) =>
      '$req ${typeSL(field.type)} ${field.name}';

  /// ex. ({required double velocity, required double? angle,})
  String topBuilderDecArgs(ManifestItem item) => item.fields
      .map(topBuilderDecArg)
      .joinArgsFull()
      .withBracesOrNot()
      .withParenthesis();

  /// ex. angle: angle
  String subConstructorCallArg(ManifestField field) =>
      '${field.name}: ${field.name}';

  /// ex. (angle: angle, velocity: velocity,)
  String topBuilderCallArgs(ManifestItem item) =>
      item.fields.map(subConstructorCallArg).joinArgsFull().withParenthesis();

  /// ex. double? angle
  String topBuilderWrappedDecArg(ManifestField field) =>
      '${typeSL(field.type)} ${field.name}';

  /// ex. (double velocity, double? angle,)
  String topBuilderWrappedDecArgs(ManifestItem item) =>
      item.fields.map(topBuilderWrappedDecArg).joinArgsFull().withParenthesis();

  /// ex. angle
  String subConstructorWrappedCallArg(ManifestField field) => '${field.name}';

  /// ex. (angle,)
  String topBuilderWrappedCallArgs(ManifestItem item) => item.fields
      .map(subConstructorWrappedCallArg)
      .joinArgsFull()
      .withParenthesis();

  /// ex. static WeatherSunny sunny() => WeatherSunny();
  ///
  /// ex. static ResultSuccess<T> <T extends num>success(...) =>
  /// ResultSuccess<T>(...)
  String topStaticBuilder(ManifestItem item) => [
        annotationFactory,
        [
          'static ${subCall(item)} ${subLower(item)}$genericDec',
          topBuilderDecArgs(item),
          ' => ${subCall(item)}',
          topBuilderCallArgs(item),
          ';',
        ].joinParts(),
      ].joinLines();

  /// ex. factory Weather.sunny() = WeatherSunny;
  ///
  /// ex. factory Result.success(...) = ResultSuccess<T>;
  String topFactoryBuilder(ManifestItem item) => [
        'const factory $top.${subLower(item)}',
        topBuilderDecArgs(item),
        ' = ',
        subCall(item),
        ';',
      ].joinParts();

  /// top builder methods
  Iterable<String> topBuilderMethods() => manifest.items.map(topFactoryBuilder);
}
