import 'package:analyzer/dart/element/element.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/constants/reader.dart';

/// map equality
const _equalityMapping = {
  Equality.data: ManifestEquality.data,
  Equality.identity: ManifestEquality.identity,
  Equality.distinct: ManifestEquality.distinct,
};

/// map equality
ManifestEquality _mapEquality(Equality equality) => _equalityMapping[equality]!;

/// filter metadata by type
List<ConstantReader> _filterMetadataOfType<T>(Element element) =>
    TypeChecker.fromRuntime(T)
        .annotationsOf(element)
        .map((e) => ConstantReader(e))
        .toList();

/// find @[WithEquality] or null
ConstantReader? _findWithEqualityOrNull(Element element) =>
    _filterMetadataOfType<WithEquality>(element).firstOrNull;

/// read equality from enum object
Equality _readEquality(ConstantReader obj) =>
    Equality.values[obj.read('index').intValue];

/// read [WithEquality]
Equality _readWithEquality(ConstantReader obj) =>
    _readEquality(obj.read('equality'));

/// extract @[WithEquality] or null
ManifestEquality? extractWithEqualityOrNull(Element element) {
  final obj = _findWithEqualityOrNull(element);
  if (obj != null) {
    final equality = _readWithEquality(obj);
    return _mapEquality(equality);
  } else {
    return null;
  }
}

/// find @[WithPrefix] or null
ConstantReader? _findWithPrefixOrNull(Element element) =>
    _filterMetadataOfType<WithPrefix>(element).firstOrNull;

/// read [WithPrefix]
String _readWithPrefix(ConstantReader obj) => obj.read('prefix').stringValue;

/// extract @[WithPrefix] or null
String? extractWithPrefixOrNull(Element element) {
  final obj = _findWithPrefixOrNull(element);
  if (obj != null) {
    final prefix = _readWithPrefix(obj);
    // empty prefix is allowed
    if (prefix.isNotEmpty) {
      require(
        prefix.isGenTypeName(),
        () => "name prefix '$prefix' should be a valid type name",
      );
      require(
        prefix.isPublic(),
        () => "name prefix '$prefix' should be public",
      );
      require(
        prefix.startsWithUpper(),
        () => "name prefix '$prefix' should start with upper case letter",
      );
    }
    return prefix;
  } else {
    return null;
  }
}

/// find @[WithName] or null
ConstantReader? _findWithNameOrNull(Element element) =>
    _filterMetadataOfType<WithName>(element).firstOrNull;

/// read [WithName]
String _readWithName(ConstantReader obj) => obj.read('name').stringValue;

/// extract @[WithName] or null
String? extractWithNameOrNull(Element element) {
  final obj = _findWithNameOrNull(element);
  if (obj != null) {
    final name = _readWithName(obj);
    require(
      name.isGenTypeName(),
      () => "overridden name '$name' should be a valid type name",
    );
    require(
      name.isPublic(),
      () => "overridden name '$name' should be public",
    );
    require(
      name.startsWithUpper(),
      () => "overridden name '$name' should start with upper case letter",
    );
    return name;
  } else {
    return null;
  }
}

/// find @[WithName] or null
ConstantReader? _findWithTypeOrNull(Element element) =>
    _filterMetadataOfType<WithType>(element).firstOrNull;

/// read [WithType]
String _readWithType(ConstantReader obj) => obj.read('type').stringValue;

/// extract @[WithName] or null
String? extractWithTypeOrNull(Element element) {
  final obj = _findWithTypeOrNull(element);
  if (obj != null) {
    final type = _readWithType(obj);
    require(
      type.isExternalTypeName(),
      () => "overridden type name '$type' should be a valid type name"
          ', optionally with nullability sign',
    );
    return type;
  } else {
    return null;
  }
}
