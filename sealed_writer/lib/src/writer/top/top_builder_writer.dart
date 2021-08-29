import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_utils_writer.dart';

/// top builder writer
class TopBuilderWriter extends BaseUtilsWriter {
  const TopBuilderWriter(Manifest manifest) : super(manifest);

  /// ex. required double velocity
  /// ex. double? angle
  String topBuilderDecArg(ManifestField field) => [
        if (!field.type.isNullable) '$req ',
        '${typeSL(field.type)} ${field.name}',
      ].joinParts();

  /// ex. ({required double velocity, double? angle,})
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
        'static ${subCall(item)} ${subLower(item)}$genericDec',
        topBuilderDecArgs(item),
        ' => ${subCall(item)}',
        topBuilderCallArgs(item),
        ';',
      ].joinParts();

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
