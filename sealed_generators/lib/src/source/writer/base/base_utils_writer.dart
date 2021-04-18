import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/base/base_writer.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';

/// base writer utilities
@immutable
abstract class BaseUtilsWriter extends BaseWriter {
  const BaseUtilsWriter(Source source) : super(source);

  /// manifest
  @protected
  @nonVirtual
  @visibleForTesting
  Manifest get manifest => source.manifest;

  /// options
  @protected
  @nonVirtual
  @visibleForTesting
  Options get options => source.options;

  /// @sealed final (closed) class
  @protected
  @nonVirtual
  @visibleForTesting
  String get annotationClosed => '@sealed';

  /// @immutable
  @protected
  @nonVirtual
  @visibleForTesting
  String get annotationImmutable => '@immutable';

  /// @factory
  @protected
  @nonVirtual
  @visibleForTesting
  String get annotationFactory => '@factory';

  /// @override
  @protected
  @nonVirtual
  @visibleForTesting
  String get annotationOverride => '@override';

  /// nullability suffix: "?" or "/*?*/"
  @protected
  @nonVirtual
  @visibleForTesting
  String get n => options.isNullSafe ? '?' : '/*?*/';

  /// only nullable in legacy
  @protected
  @nonVirtual
  @visibleForTesting
  String get nl => options.isNullSafe ? '' : '/*?*/';

  /// non-nullability suffix: "" or "/*!*/"
  @protected
  @nonVirtual
  @visibleForTesting
  String get nn => options.isNullSafe ? '' : '/*!*/';

  /// required or @required
  @protected
  @nonVirtual
  @visibleForTesting
  String get req => options.isNullSafe ? 'required' : '@required';

  /// top class name, ex. Weather
  @protected
  @nonVirtual
  @visibleForTesting
  String get top => manifest.name;

  /// top class name with lower start, ex. weather
  @protected
  @nonVirtual
  @visibleForTesting
  String get topLower => top.toLowerStart();

  /// short sub class name, ex. Sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String subUpper(ManifestItem item) => item.shortName.toUpperStart();

  /// sub class name, ex. WeatherSunny
  @protected
  @nonVirtual
  @visibleForTesting
  String subFull(ManifestItem item) => item.name;

  /// lower start short sub class name, ex. sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String subLower(ManifestItem item) => item.shortName;

  /// ex. double or double/*!*/, double? or double/*?*/
  @protected
  @nonVirtual
  @visibleForTesting
  String typeSL(ManifestType type) =>
      type.isNullable ? '${type.name}$n' : '${type.name}$nn';

  /// ex. final weather = this;
  @protected
  @nonVirtual
  @visibleForTesting
  String initThisValue() => 'final $topLower = this;';

  @protected
  @nonVirtual
  @visibleForTesting
  bool get isGeneric => manifest.params.isNotEmpty;

  /// ex. T extends Object
  @nonVirtual
  @visibleForTesting
  String genericDecPart(ManifestParam param) =>
      '${param.name} extends ${typeSL(param.bound)}';

  /// ex. <T extends Object>
  @protected
  @nonVirtual
  @visibleForTesting
  String get genericDec =>
      manifest.params.map(genericDecPart).joinArgsSimple().withLtGtOrNot();

  /// ex. T
  @nonVirtual
  @visibleForTesting
  String genericCallPart(ManifestParam param) => param.name;

  /// ex. <T>
  @protected
  @nonVirtual
  @visibleForTesting
  String get genericCall =>
      manifest.params.map(genericCallPart).joinArgsSimple().withLtGtOrNot();

  /// top class name with params for declaration.
  /// ex. Result<T extends Object> or Weather
  @protected
  @nonVirtual
  @visibleForTesting
  String get topDec => '$top$genericDec';

  /// top class name with params for call.
  /// ex. Result<T> or Weather
  @protected
  @nonVirtual
  @visibleForTesting
  String get topCall => '$top$genericCall';

  /// sub class name with params for declaration.
  /// ex. WeatherSunny or ResultSuccess<T extends Object>
  @protected
  @nonVirtual
  @visibleForTesting
  String subDec(ManifestItem item) => '${subFull(item)}$genericDec';

  /// sub class name with params for call.
  /// ex. WeatherSunny or ResultSuccess<T>
  @protected
  @nonVirtual
  @visibleForTesting
  String subCall(ManifestItem item) => '${subFull(item)}$genericCall';
}
