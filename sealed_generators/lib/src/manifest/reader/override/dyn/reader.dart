import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/legacy_fixer.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:source_gen/source_gen.dart';

/// apply to manifest
///
/// todo test read
@sealed
@immutable
class TypeOverrideDynamicReader {
  static const String metaClassName = 'SealedOverrideDynamic';

  @nonVirtual
  final Options options;

  @visibleForTesting
  @nonVirtual
  final OverrideDynamicLegacyFixer fixer;

  const TypeOverrideDynamicReader(this.options)
      : fixer = const OverrideDynamicLegacyFixer();

  TypeOverrideDynamic? readOrNull(MethodElement method) {
    final reader = _metaReaderOrNull(method);
    if (reader == null) {
      return null;
    } else {
      final type = _readType(reader);
      final override = mapOverride(type);
      return options.isNullSafe ? override : fixer.fix(override);
    }
  }

  @nonVirtual
  @visibleForTesting
  TypeOverrideDynamic mapOverride(String type) => TypeOverrideDynamic(
        type: type.readType(),
      );

  String _readType(ConstantReader reader) {
    final type = reader.read('type').stringValue;
    require(
      type.isSimpleOrNullableTypeName(),
      () => 'malformed type name "$type"',
    );
    return type;
  }

  ConstantReader? _metaReaderOrNull(MethodElement method) {
    final readers = method.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) =>
              e?.type?.getDisplayString(withNullability: false) ==
              metaClassName,
        )
        .map((e) => ConstantReader(e))
        .toList();
    require(
      readers.isSingleOrEmpty,
      'can have at most one $metaClassName annotation',
    );
    return readers.firstOrNull;
  }
}
