import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart';
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
@immutable
class ManifestReader {
  ManifestReader(this.options)
      : todReader = TypeOverrideDynamicReader(options),
        tonReader = TypeOverrideNamedReader(options);

  @nonVirtual
  final Options options;

  @nonVirtual
  @visibleForTesting
  final TypeOverrideDynamicReader todReader;

  @nonVirtual
  @visibleForTesting
  final TypeOverrideNamedReader tonReader;

  Manifest read(Element element) => _extractManifest(
        _extractClassElement(element),
      );

  /// extract class element
  ClassElement _extractClassElement(Element e) {
    require(
      e is ClassElement,
      'element should be a class',
    );
    final cls = e as ClassElement;
    require(
      !cls.isEnum && !cls.isMixin && !cls.isMixinApplication,
      'element should be a Class',
    );
    require(
      cls.isPrivate && cls.name.isPrivate(),
      'class should be private',
    );
    require(
      cls.allSupertypes.length == 1,
      'class can only have Object as super type',
    );
    return cls;
  }

  /// extract manifest from class element
  Manifest _extractManifest(ClassElement cls) => Manifest(
        name: _extractTopName(cls),
        params: _extractParams(cls),
        items: _extractItems(cls),
      );

  /// extract top class name
  String _extractTopName(ClassElement cls) {
    final name = cls.name;
    require(
      name.isGenTypeName() && name.isPrivate(),
      () => 'malformed class name "$name"',
    );
    return name.substring(1);
  }

  /// extract  class param
  ///
  /// default bound: for nullsafe Object and for legacy Object?
  ManifestParam _extractParam(TypeParameterElement p) {
    final bound = p.bound;
    return ManifestParam(
      name: p.name,
      bound: bound != null ? _extractManifestType(bound) : _defaultUpperBound(),
    );
  }

  /// extract class params
  List<ManifestParam> _extractParams(ClassElement cls) =>
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
    return ManifestItem(
      name: _extractSubName(method),
      fields: _extractFields(method),
    );
  }

  /// extract items from class element
  List<ManifestItem> _extractItems(ClassElement cls) =>
      cls.methods.map(_extractItem).toList();

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

  // todo bad design
  /// default upper bound
  ManifestType _defaultUpperBound() => ManifestType(
        name: 'Object',
        isNullable: options.isNullSafe ? false : true,
      );
}
