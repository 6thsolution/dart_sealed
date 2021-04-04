import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

class ManifestReader {
  ManifestReader._() {
    throw AssertionError();
  }

  static Manifest read(Element element) {
    final cls = _extractClassElement(element);
    final params = _extractClassParams(cls);
    final name = _extractTopClassName(cls);
    final items = _extractManifestItems(cls, name);
    return Manifest(name: name, items: items, params: params);
  }

  static ClassElement _extractClassElement(Element element) {
    final name = element.name;
    require(
      element is ClassElement,
      () => 'element($name) should be a class',
    );
    final cls = element as ClassElement;
    require(
      !cls.isEnum && !cls.isMixin && !cls.isMixinApplication,
      () => 'element($name) should be a Class',
    );
    require(
      cls.isPrivate,
      () => 'class($name) should be private',
    );
    require(
      cls.isAbstract,
      () => 'class($name) should be abstract',
    );
    require(
      cls.allSupertypes.length == 1,
      () => 'class($name) can only have Object as super type',
    );
    return cls;
  }

  static List<ManifestParam> _extractClassParams(ClassElement cls) {
    final params = cls.typeParameters;
    final outs = <ManifestParam>[];
    for (var param in params) {
      var name = param.name;
      final type = ManifestType(name: name, isNullable: false);
      final bound = param.bound;
      if (bound != null) {
        final boundName = bound.getDisplayString(withNullability: false);
        final isNullable = bound.nullabilitySuffix != NullabilitySuffix.none;
        outs.add(ManifestParam(
          type: type,
          bound: ManifestType(name: boundName, isNullable: isNullable),
        ));
      } else {
        outs.add(ManifestParam(
          type: type,
          bound: ManifestType.defaultSuper,
        ));
      }
    }
    return outs;
  }

  static String _extractTopClassName(ClassElement cls) {
    final name = cls.name;
    require(
      name != '_',
      () => 'class($name) name should not be a single "_"',
    );
    final topName = name.substring(1);
    require(
      !topName.contains('_'),
      () => 'class($name) name can not have multiple "_"s',
    );
    return topName;
  }

  static List<ManifestItem> _extractManifestItems(
    ClassElement cls,
    String name,
  ) {
    final items = <ManifestItem>[];
    for (final method in cls.methods) {
      final methodName = method.name;
      require(
        method.isPublic,
        () => 'method($name.$methodName) should be pubic',
      );
      require(
        method.typeParameters.isEmpty,
        () => 'method($name.$methodName) can not have type parameters',
      );
      require(
        RegExp(r'[a-z].*').hasMatch(methodName),
        () => 'method($name.$methodName) should start with lower case letter',
      );
      final subName = methodName.toUpperStart();
      final fields = <ManifestField>[];
      for (final arg in method.parameters) {
        final argName = arg.name;
        final argType = arg.type;
        final argTypeName = argType.getDisplayString(withNullability: false);
        // assume legacy types as nullable
        final isNullable = argType.nullabilitySuffix != NullabilitySuffix.none;
        fields.add(ManifestField(
          name: argName,
          type: ManifestType(name: argTypeName, isNullable: isNullable),
        ));
      }
      items.add(ManifestItem(name: subName, fields: fields));
    }
    return items;
  }
}
