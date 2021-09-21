import 'package:sealed_writer/src/exceptions/exceptions.dart';
import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:sealed_writer/src/utils/name_utils.dart';

const _matchNames = [
  'when',
  'maybeWhen',
  'partialWhen',
  'whenOrNull',
  'map',
  'maybeMap',
  'partialMap',
  'mapOrNull',
];

void checkManifestIntegrity(Manifest manifest) {
  _checkParamNames(manifest);
  _checkFullClassNames(manifest);
  _checkShortNames(manifest);
  _checkFieldNames(manifest);
  _checkCommon(manifest);
  _checkThisValueName(manifest);
  _checkMatchNames(manifest);
  _checkEquatableNames(manifest);
}

/// some checks on list of objects
extension StringListCheckingExt on List<String> {
  /// no equal objects in a list
  void checkNoEquals() {
    check(length == toSet().length);
  }

  /// check this list is subset of other list
  void checkIsSubsetOf(List<String> list) {
    for (final obj in this) {
      check(list.contains(obj));
    }
  }

  /// check contains obj
  void checkNotContains(String obj) {
    check(!contains(obj));
  }
}

/// field name extractor
String _fieldName(ManifestField field) => field.name;

/// item full name extractor
String _itemFullName(ManifestItem item) => item.name;

/// item short name extractor
String _itemShortName(ManifestItem item) => item.shortName;

/// param name extractor
String _paramName(ManifestParam param) => param.name;

/// check no equal param names
void _checkParamNames(Manifest manifest) {
  manifest.params.map(_paramName).toList().checkNoEquals();
}

/// check no equal full class names
void _checkFullClassNames(Manifest manifest) {
  [
    manifest.name,
    ...manifest.items.map(_itemFullName),
  ].checkNoEquals();
}

/// check no equal short names
void _checkShortNames(Manifest manifest) {
  manifest.items.map(_itemShortName).toList().checkNoEquals();
}

/// check no equal field names for all items
void _checkFieldNames(Manifest manifest) {
  for (final item in manifest.items) {
    item.fields.map(_fieldName).toList().checkNoEquals();
  }
}

/// check all common fields are in all item fields
void _checkCommon(Manifest manifest) {
  final commonFields = manifest.fields.map(_fieldName).toList();
  for (final item in manifest.items) {
    final subFields = item.fields.map(_fieldName).toList();
    commonFields.checkIsSubsetOf(subFields);
  }
}

/// check topLower name is not equal to any short item name
void _checkThisValueName(Manifest manifest) {
  manifest.items.map(_itemShortName).toList().checkNotContains(
        manifest.name.toLowerStart(),
      );
}

/// check no usage of match method names
void _checkMatchNames(Manifest manifest) {
  for (final item in manifest.items) {
    [
      ..._matchNames,
      ...item.fields.map(_fieldName).toList(),
    ].checkNoEquals();
  }
}

/// check no usage of equatable `props` method name
void _checkEquatableNames(Manifest manifest) {
  for (final item in manifest.items) {
    if (item.equality == ManifestEquality.data) {
      item.fields.map(_fieldName).toList().checkNotContains('props');
    }
  }
}
