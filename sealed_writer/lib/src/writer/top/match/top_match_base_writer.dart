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
  @protected
  @nonVirtual
  @visibleForTesting
  String get topMatchParam => '<R extends Object$n>';

  /// required (R Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArg(ManifestItem item) => '$req R Function'
      '(${subCall(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (R Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArgOrElse() => '$req R Function'
      '($topCall$nn $topLower)$nn orElse';

  /// required R orDefault
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNNArgOrDefault() => '$req R orDefault';

  /// (R Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchGenericNArg(ManifestItem item) => 'R Function'
      '(${subCall(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// required (void Function(WeatherSunny sunny)) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArg(ManifestItem item) => '$req void Function'
      '(${subCall(item)}$nn ${subLower(item)})$nn ${subLower(item)}';

  /// required (void Function(Weather weather)) orElse
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNNArgOrElse() => '$req void Function'
      '($topCall$nn $topLower)$nn orElse';

  /// (void Function(WeatherSunny sunny))? sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchVoidNArg(ManifestItem item) => 'void Function'
      '(${subCall(item)}$nn ${subLower(item)})$n ${subLower(item)}';

  /// assert(sunny != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssert(ManifestItem item) =>
      'assert(${subLower(item)} != null);';

  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAsserts() => manifest.items.map(topMatchAssert).joinLines();

  /// assert(orElse != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssertOrElse() => 'assert(orElse != null);';

  /// assert(orDefault != null)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchAssertOrDefault() => 'assert(orDefault != null);';

  /// ex. throw AssertionError();
  @protected
  @nonVirtual
  @visibleForTesting
  String throwAssertion() => 'throw AssertionError();';

  /// else clause with throw
  @protected
  @nonVirtual
  @visibleForTesting
  Else throwingElse() => Else(
        code: throwAssertion(),
      );

  /// ex. double? angle
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWrappedItemArg(ManifestField field) =>
      '${typeSL(field.type)} ${field.name}';

  /// ex. (double velocity, double? angle)
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWrappedItemArgs(ManifestItem item) => item.fields
      .map(topMatchWrappedItemArg)
      .joinArgsSimple()
      .withParenthesis();

  /// required R Function(double velocity, double? angle) sunny
  @protected
  @nonVirtual
  @visibleForTesting
  String topMatchWrappedGenericNNArg(ManifestItem item) => [
        '$req R Function',
        topMatchWrappedItemArgs(item),
        '$nn ${subLower(item)}',
      ].joinParts();
}
