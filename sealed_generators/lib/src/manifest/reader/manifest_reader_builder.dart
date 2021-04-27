import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/manifest/reader/manifest_reader.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';
import 'package:source_gen/src/constants/reader.dart';

/// provides options and details not general to the manifest to reader
@sealed
class ManifestReaderBuilder {
  /// options.
  final Options options;

  const ManifestReaderBuilder({
    required this.options,
  });

  /// build manifest reader
  ManifestReader build(
    Element element,
    ConstantReader annotation,
  ) {
    final defaultEquality = _readDefaultEquality(annotation);
    final cls = _extractClassElement(element);
    final name = _extractTopName(cls);
    return ManifestReader(
      options: options,
      name: name,
      defaultEquality: defaultEquality,
      cls: cls,
    );
  }

  /// read default equality from [Sealed] annotations
  Equality _readDefaultEquality(ConstantReader annotation) =>
      _readEquality(annotation.read('equality'));

  /// read equality from enum object
  Equality _readEquality(ConstantReader obj) =>
      Equality.values[obj.read('index').intValue];

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

  /// extract top class name
  String _extractTopName(ClassElement cls) {
    final name = cls.name;
    require(
      name.isGenTypeName() && name.isPrivate(),
      () => "malformed class name '$name'",
    );
    final str = name.substring(1);
    require(
      str.startsWithUpper(),
      () => "class '$name' name should start with upper case letter",
    );
    return str;
  }
}
