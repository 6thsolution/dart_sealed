import 'package:meta/meta.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/source/source.dart';
import 'package:sealed_writer/src/utils/branch_utils.dart';
import 'package:sealed_writer/src/utils/string_utils.dart';
import 'package:sealed_writer/src/writer/base/base_cast_utils_writer.dart';

/// match method writer base
@sealed
@immutable
class TopMatchBaseWriter extends BaseCastUtilsWriter {
  const TopMatchBaseWriter(Source source) : super(source);

  /// <R extends Object?>
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  String topMatchGenericNNArg(ManifestItem item) => '$req R Function'
      '(${subCall(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required R Function(Weather weather) orElse
  String topMatchGenericNNArgOrElse() => '$req R Function'
      '($topCall$nn $topLower)$nn orElse';

  /// required R orDefault
  String topMatchGenericNNArgOrDefault() => '$req R orDefault';

  /// R Function(WeatherSunny sunny)? sunny
  String topMatchGenericNArg(ManifestItem item) => 'R Function'
      '(${subCall(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// required void Function(WeatherSunny sunny) sunny
  String topMatchVoidNNArg(ManifestItem item) => '$req void Function'
      '(${subCall(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required void Function(Weather weather) orElse
  String topMatchVoidNNArgOrElse() => '$req void Function'
      '($topCall$nn $topLower)$nn orElse';

  /// void Function(WeatherSunny sunny)? sunny
  String topMatchVoidNArg(ManifestItem item) => 'void Function'
      '(${subCall(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// assert(sunny != null)
  String topMatchAssert(ManifestItem item) =>
      'assert(${subLower(item)} != null);';

  String topMatchAsserts() => manifest.items.map(topMatchAssert).joinLines();

  /// assert(orElse != null)
  String topMatchAssertOrElse() => 'assert(orElse != null);';

  /// assert(orDefault != null)
  String topMatchAssertOrDefault() => 'assert(orDefault != null);';

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
        '$nn ${subLower(item)}',
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
        '$nn ${subLower(item)}',
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

  /// adaptive
  String topMatchNonOrWrappedItemCallArgs(ManifestItem item) => item.isWrapped
      ? topMatchWrappedItemCallArgs(item)
      : topMatchItemCallArgs();

  /// adaptive
  String topMatchNonOrWrappedGenericNNArg(ManifestItem item) => item.isWrapped
      ? topMatchWrappedGenericNNArg(item)
      : topMatchGenericNNArg(item);

  /// adaptive
  String topMatchNonOrWrappedGenericNArg(ManifestItem item) => item.isWrapped
      ? topMatchWrappedGenericNArg(item)
      : topMatchGenericNArg(item);

  /// adaptive
  String topMatchNonOrWrappedVoidNNArg(ManifestItem item) =>
      item.isWrapped ? topMatchWrappedVoidNNArg(item) : topMatchVoidNNArg(item);

  /// adaptive
  String topMatchNonOrWrappedVoidNArg(ManifestItem item) =>
      item.isWrapped ? topMatchWrappedVoidNArg(item) : topMatchVoidNArg(item);
}
