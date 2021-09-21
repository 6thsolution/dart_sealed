import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_cast_utils_writer.dart';

/// match method writer base
class TopMatchBaseWriter extends BaseCastUtilsWriter {
  const TopMatchBaseWriter(Manifest manifest) : super(manifest);

  /// <R extends Object?>
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  String topMatchGenericNNArg(ManifestItem item) => '$req R Function'
      '(${subCall(item)} ${subLower(item)}) ${subLower(item)}';

  /// required R Function(Weather weather) orElse
  String topMatchGenericNNArgOrElse() => '$req R Function'
      '($topCall $topLower) orElse';

  /// required R Function(Weather weather) orElse
  String topMatchGenericNArgOrElse() => 'R Function'
      '($topCall $topLower)? orElse';

  /// required R orDefault
  String topMatchGenericNNArgOrDefault() => '$req R orDefault';

  /// R Function(WeatherSunny sunny)? sunny
  String topMatchGenericNArg(ManifestItem item) => 'R Function'
      '(${subCall(item)} ${subLower(item)})$n ${subLower(item)}';

  /// required void Function(WeatherSunny sunny) sunny
  String topMatchVoidNNArg(ManifestItem item) => '$req void Function'
      '(${subCall(item)} ${subLower(item)}) ${subLower(item)}';

  /// required void Function(Weather weather) orElse
  String topMatchVoidNNArgOrElse() => '$req void Function'
      '($topCall $topLower) orElse';

  /// void Function(Weather weather)? orElse
  String topMatchVoidNArgOrElse() => 'void Function'
      '($topCall $topLower)$n orElse';

  /// void Function(WeatherSunny sunny)? sunny
  String topMatchVoidNArg(ManifestItem item) => 'void Function'
      '(${subCall(item)} ${subLower(item)})$n ${subLower(item)}';

  /// ex. throw AssertionError();
  String throwAssertion() => 'throw AssertionError();';

  /// else clause with throw
  Else throwingElse() => Else(
        code: throwAssertion(),
      );

  /// ex. double? angle
  String topMatchWrappedItemArg(ManifestField field) =>
      '${typeSL(field.type)} ${field.name}';

  /// ex. (double velocity, double? angle)
  String topMatchWrappedItemArgs(ManifestItem item) => item.fields
      .map(topMatchWrappedItemArg)
      .joinArgsSimple()
      .withParenthesis();

  /// required R Function(double velocity, double? angle) sunny
  String topMatchWrappedGenericNNArg(ManifestItem item) => [
        '$req R Function',
        topMatchWrappedItemArgs(item),
        ' ${subLower(item)}',
      ].joinParts();

  /// R Function(double velocity, double? angle)? sunny
  String topMatchWrappedGenericNArg(ManifestItem item) => [
        'R Function',
        topMatchWrappedItemArgs(item),
        '$n ${subLower(item)}',
      ].joinParts();

  /// required void Function(double velocity, double? angle) sunny
  String topMatchWrappedVoidNNArg(ManifestItem item) => [
        '$req void Function',
        topMatchWrappedItemArgs(item),
        ' ${subLower(item)}',
      ].joinParts();

  /// void Function(double velocity, double? angle)? sunny
  String topMatchWrappedVoidNArg(ManifestItem item) => [
        'void Function',
        topMatchWrappedItemArgs(item),
        '$n ${subLower(item)}',
      ].joinParts();

  /// ex. weather.angle
  String topMatchWrappedItemCallArg(ManifestField field) =>
      '$topLower.${field.name}';

  /// ex. (double velocity, double? angle)
  String topMatchWrappedItemCallArgs(ManifestItem item) => item.fields
      .map(topMatchWrappedItemCallArg)
      .joinArgsSimple()
      .withParenthesis();

  /// ex. (weather)
  String topMatchItemCallArgs() => '($topLower)';
}
