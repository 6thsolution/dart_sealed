import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/overrider.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/reader.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/overrider.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/reader.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';

/// todo test read
@sealed
class ManifestReader {
  ManifestReader({
    required this.options,
    required this.name,
    required this.defaultEquality,
    required this.cls,
  })   : todReader = TypeOverrideDynamicReader(options),
        tonReader = TypeOverrideNamedReader(options);

  /// options.
  final Options options;

  /// top class name, like: Weather.
  final String name;

  /// default equality.
  final Equality defaultEquality;

  /// checked class element for manifest
  final ClassElement cls;

  @visibleForTesting
  final TypeOverrideDynamicReader todReader;

  @visibleForTesting
  final TypeOverrideNamedReader tonReader;

  /// read manifest
  Manifest read() => Manifest(
        name: name,
        params: _extractParams(),
        items: _extractItems(),
      );

  /// extract  class param
  ManifestParam _extractParam(TypeParameterElement p) {
    final bound = p.bound;
    return ManifestParam(
      name: p.name,
      bound: bound != null ? _extractManifestType(bound) : _defaultUpperBound,
    );
  }

  /// extract class params
  List<ManifestParam> _extractParams() =>
      cls.typeParameters.map(_extractParam).toList();

  /// extract sub class name
  String _extractSubName(MethodElement method) {
    require(
      method.name.isGenFieldName(),
      () => 'malformed method name "${method.name}"',
    );
    return method.name.toUpperStart();
  }

  /// extract field from method argument without overrides
  ///
  /// assume legacy types as nullable
  ManifestField _extractFieldBase(ParameterElement arg) {
    require(
      arg.name.isGenFieldName(),
      () => 'malformed method argument name "${arg.name}"',
    );
    return ManifestField(
      name: arg.name,
      type: _extractManifestType(arg.type),
    );
  }

  /// extract fields from method without overrides
  List<ManifestField> _extractFieldsBase(MethodElement method) =>
      method.parameters.map(_extractFieldBase).toList();

  /// extract and apply dynamic overrides to fields if needed
  List<ManifestField> _applyFieldsDynamicOverrides(
    MethodElement method,
    List<ManifestField> fields,
  ) {
    final tod = todReader.readOrNull(method);
    return tod != null ? TypeOverriderDynamic(tod).apply(fields) : fields;
  }

  /// extract and apply named overrides to fields if needed
  List<ManifestField> _applyFieldsNamedOverrides(
    MethodElement method,
    List<ManifestField> fields,
  ) {
    final ton = tonReader.readOrNull(method);
    return ton != null ? TypeOverriderNamed(ton).apply(fields) : fields;
  }

  /// extract fields from method
  List<ManifestField> _extractFields(MethodElement method) =>
      _applyFieldsNamedOverrides(
        method,
        _applyFieldsDynamicOverrides(
          method,
          _extractFieldsBase(method),
        ),
      );

  /// extract item from method
  ManifestItem _extractItem(MethodElement method) {
    require(
      method.isPublic && method.name.isPublic(),
      () => 'method "${method.name}" should be pubic',
    );
    require(
      method.name.startsWithLower(),
      () => 'method "${method.name}" should start with lower case letter',
    );
    require(
      method.typeParameters.isEmpty,
      () => 'method "${method.name}" can not have type parameters',
    );
    final short = _extractSubName(method);
    final defaultFull = _defaultFullName(short);
    return ManifestItem(
      shortName: short,
      fullName: defaultFull,
      equality: defaultEquality,
      fields: _extractFields(method),
    );
  }

  /// default full name of a sub class,
  /// like WeatherRainy.
  String _defaultFullName(String shortName) => '$name$shortName';

  /// extract items from class element
  List<ManifestItem> _extractItems() => cls.methods.map(_extractItem).toList();

  /// type name without any nullability sign
  String _extractTypeName(DartType type) =>
      type.getDisplayString(withNullability: false);

  /// type is nullable?
  ///
  /// will be nullable in legacy projects
  bool _extractTypeIsNullable(DartType type) =>
      !options.isNullSafe || type.nullabilitySuffix != NullabilitySuffix.none;

  /// extract manifest type
  ManifestType _extractManifestType(DartType type) => ManifestType(
        name: _extractTypeName(type),
        isNullable: _extractTypeIsNullable(type),
      );

  /// default upper bound
  ///
  /// all no bound types are considered nullable
  static final _defaultUpperBound = ManifestType(
    name: 'Object',
    isNullable: true,
  );
}
