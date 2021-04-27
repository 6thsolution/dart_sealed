import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:source_gen/source_gen.dart';

/// manifest reader built by manifest reader builder
@sealed
class ManifestReader {
  ManifestReader({
    required this.options,
    required this.name,
    required this.defaultEquality,
    required this.cls,
  });

  /// options.
  final Options options;

  /// top class name, like: Weather.
  final String name;

  /// default equality.
  final Equality defaultEquality;

  /// checked class element for manifest
  final ClassElement cls;

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

  /// extract sub class name, like 'rainy'
  String _extractShortSubName(MethodElement method) {
    require(
      method.isPublic && method.name.isPublic(),
      () => "method '${method.name}' should be pubic",
    );
    require(
      method.name.startsWithLower(),
      () => "method '${method.name}' should start with lower case letter",
    );
    require(
      method.name.isGenFieldName(),
      () => "malformed method name '${method.name}'",
    );
    return method.name;
  }

  /// extract field from method argument without overrides
  ///
  /// assume legacy types as nullable
  ManifestField _extractField(ParameterElement arg) {
    require(
      arg.name.isPublic(),
      () => "method argument '${arg.name}' should not start with '_'",
    );
    require(
      arg.name.startsWithLower(),
      () => "method argument '${arg.name}' should start with lower case",
    );
    require(
      arg.name.isGenFieldName(),
      () => "malformed method argument name '${arg.name}'",
    );
    return ManifestField(
      name: arg.name,
      type: _readOverriddenTypeOrNull(arg) ?? _extractManifestType(arg.type),
    );
  }

  /// extract fields from method
  List<ManifestField> _extractFields(MethodElement method) =>
      method.parameters.map(_extractField).toList();

  /// extract item from method
  ManifestItem _extractItem(MethodElement method) {
    require(
      method.typeParameters.isEmpty,
      () => "method '${method.name}' can not have type parameters",
    );
    final lower = _extractShortSubName(method);
    final meta = _readMeta(method);
    return ManifestItem(
      shortName: lower,
      name: meta.name ?? _defaultFullName(lower),
      equality: meta.equality ?? defaultEquality,
      fields: _extractFields(method),
    );
  }

  /// default full name of a sub class,
  /// like WeatherRainy.
  String _defaultFullName(String shortName) =>
      '$name${shortName.toUpperStart()}';

  /// extract items from class element
  List<ManifestItem> _extractItems() {
    final items = cls.methods.map(_extractItem).toList();
    require(
      items.isNotEmpty,
      'sealed classes should have at least one item',
    );
    return items;
  }

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

  /// filter metadata by type
  List<ConstantReader> _firstMetadataOrNull<T>(Element element) =>
      TypeChecker.fromRuntime(T)
          .annotationsOf(element)
          .map((e) => ConstantReader(e))
          .toList();

  /// [Meta] reader for an item or null if not present
  ConstantReader? _metaReaderOrNull(MethodElement method) =>
      _firstMetadataOrNull<Meta>(method).firstOrNull;

  /// read equality from [Equality] object
  Equality? _readMetaEqualityNullable(ConstantReader obj) {
    final eq = obj.read('equality');
    return eq.isNull ? null : _readEquality(eq);
  }

  /// read equality from enum object
  Equality _readEquality(ConstantReader obj) =>
      Equality.values[obj.read('index').intValue];

  /// read name from [Meta] object
  String? _readMetaNameNullable(ConstantReader obj) {
    final name = obj.read('name');
    final out = name.isNull ? null : name.stringValue;
    if (out != null) {
      require(
        out.isGenClassName(),
        () => "malformed overridden item name '$out'",
      );
    }
    return out;
  }

  /// read [Meta] from reader (which can be nullable)
  Meta _readMetaFromReader(ConstantReader? obj) => obj != null
      ? Meta(
          equality: _readMetaEqualityNullable(obj),
          name: _readMetaNameNullable(obj),
        )
      : const Meta();

  /// read [Meta] for an method or empty Meta if not present
  Meta _readMeta(MethodElement method) =>
      _readMetaFromReader(_metaReaderOrNull(method));

  /// read [WithType] for a parameter or null
  ConstantReader? withTypeReaderOrNull(ParameterElement arg) =>
      _firstMetadataOrNull<WithType>(arg).firstOrNull;

  /// read type from [WithType] reader or null if not present
  String? _readTypeOfWithTypeOrNull(ConstantReader? obj) =>
      obj?.read('type').stringValue;

  /// read overridden type for an argument or null
  ///
  /// and fix nullability for legacy projects
  ManifestType? _readOverriddenTypeOrNull(ParameterElement arg) {
    final typeName = _readTypeOfWithTypeOrNull(withTypeReaderOrNull(arg));
    if (typeName != null) {
      require(
        typeName.isSimpleOrNullableTypeName(),
        () => "malformed overridden type name '$typeName'",
      );
      final type = typeName.readType();
      return options.isNullSafe
          ? type
          : ManifestType(
              name: type.name,
              isNullable: true,
            );
    } else {
      return null;
    }
  }
}
