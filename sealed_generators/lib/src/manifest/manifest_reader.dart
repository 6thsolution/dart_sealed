import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';

class ManifestReader {
  ManifestReader._() {
    throw AssertionError();
  }

  static Manifest read(Element element) {
    final cls = _extractClassElement(element);
    final name = _extractTopClassName(cls);
    final items = _extractManifestItems(cls, name);
    return Manifest(name: name, items: items);
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
        RegExp(r'[a-z].*').hasMatch(methodName),
        () => 'method($name.$methodName) should start with lower case letter',
      );
      final subName = methodName.toUpperStart();
      items.add(ManifestItem(name: subName, fields: []));
    }

    return items;
  }
}
