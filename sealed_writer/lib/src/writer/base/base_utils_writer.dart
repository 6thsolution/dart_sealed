import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/name_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_writer.dart';

/// base writer utilities
abstract class BaseUtilsWriter extends BaseWriter {
  const BaseUtilsWriter(Manifest manifest) : super(manifest);

  /// @override
  String get annotationOverride => '@override';

  /// required or @required
  String get req => 'required';

  /// nullability suffix "?"
  String get n => '?';

  /// top class name, ex. Weather
  String get top => manifest.name;

  /// top class name with lower start, ex. weather
  String get topLower => top.toLowerStart();

  /// short sub class name, ex. Sunny
  String subUpper(ManifestItem item) => item.shortName.toUpperStart();

  /// sub class name, ex. WeatherSunny
  String subFull(ManifestItem item) => item.name;

  /// lower start short sub class name, ex. sunny
  String subLower(ManifestItem item) => item.shortName;

  /// ex. double, double?
  String typeSL(ManifestType type) =>
      type.isNullable ? '${type.name}$n' : type.name;

  /// ex. final weather = this;
  String initThisValue() => 'final $topLower = this;';

  /// is generic
  bool get isGeneric => manifest.params.isNotEmpty;

  /// ex. T extends Object
  String genericDecPart(ManifestParam param) =>
      '${param.name} extends ${typeSL(param.bound)}';

  /// ex. <T extends Object>
  String get genericDec =>
      manifest.params.map(genericDecPart).joinArgsSimple().withLtGtOrNot();

  /// ex. T
  String genericCallPart(ManifestParam param) => param.name;

  /// ex. <T>
  String get genericCall =>
      manifest.params.map(genericCallPart).joinArgsSimple().withLtGtOrNot();

  /// top class name with params for declaration.
  /// ex. Result<T extends Object> or Weather
  String get topDec => '$top$genericDec';

  /// top class name with params for call.
  /// ex. Result<T> or Weather
  String get topCall => '$top$genericCall';

  /// sub class name with params for declaration.
  /// ex. WeatherSunny or ResultSuccess<T extends Object>
  String subDec(ManifestItem item) => '${subFull(item)}$genericDec';

  /// sub class name with params for call.
  /// ex. WeatherSunny or ResultSuccess<T>
  String subCall(ManifestItem item) => '${subFull(item)}$genericCall';
}
