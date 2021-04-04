import 'package:meta/meta.dart';
import 'package:sealed_generators/src/exceptions/exceptions.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';

@immutable
@sealed
class Manifest {
  Manifest({
    required this.name,
    required this.items,
    this.params = const <ManifestParam>[],
  }) {
    check(name.isGenClassName());
    check(items.isNotEmpty);
  }

  /// name, for example "WeatherState".
  final String name;

  /// items. can not be empty.
  final List<ManifestItem> items;

  /// params. can be empty.
  final List<ManifestParam> params;

  @override
  String toString() => 'Manifest{name: $name, items: $items}';
}

@immutable
@sealed
class ManifestItem {
  ManifestItem({
    required this.name,
    required this.fields,
  }) {
    check(name.isGenClassName());
  }

  /// name, for example "Rainy".
  final String name;

  /// fields.
  final List<ManifestField> fields;

  @override
  String toString() => 'Item{name: $name, fields: $fields}';
}

@immutable
@sealed
class ManifestField {
  ManifestField({
    required this.name,
    required this.type,
  }) {
    check(name.startsWithLower());
  }

  /// name, for example "direction".
  final String name;

  /// type.
  final ManifestType type;

  @override
  String toString() => 'Field{name: $name, type: $type}';
}

/// nullable type
@immutable
@sealed
class ManifestType {
  ManifestType({
    required this.name,
    required this.isNullable,
  }) {
    check(name.isGenTypeName());
  }

  /// name without any ?, ! or *
  /// and their helpers like /*!*/ or /*?*/.
  ///
  /// for example "double". but
  /// can NOT be "double?".
  final String name;

  /// without considering null-safety.
  ///
  /// by default all legacy fields are nullable and
  /// this field is true.
  /// but can be overridden in future.
  final bool isNullable;

  @override
  String toString() => 'Type{name: $name, isNullable: $isNullable}';
}

/// ex. 'T extends Object?'
@immutable
@sealed
class ManifestParam {
  ManifestParam({
    required this.name,
    required this.bound,
  }) {
    check(name.isGenTypeName());
  }

  /// generic type name without any ?, ! or *
  /// and their helpers like /*!*/ or /*?*/.
  ///
  /// for example "T". but
  /// can NOT be "T?".
  final String name;

  /// type param super type like 'Object?'.
  /// can be nullable.
  final ManifestType bound;

  @override
  String toString() => 'Param{name: $name, bound: $bound}';
}
