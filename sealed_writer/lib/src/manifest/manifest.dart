import 'package:meta/meta.dart';
import 'package:sealed_writer/src/exceptions/exceptions.dart';
import 'package:sealed_writer/src/utils/list_equality_utils.dart';
import 'package:sealed_writer/src/utils/type_utils.dart';

/// Manifest
@immutable
@sealed
class Manifest {
  Manifest({
    required this.name,
    required this.items,
    required this.params,
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
  String toString() => 'Manifest{name: $name, items: $items, params: $params}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manifest &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          listEquals(items, other.items) &&
          listEquals(params, other.params);

  @override
  int get hashCode =>
      runtimeType.hashCode ^ name.hashCode ^ listHash(items) ^ listHash(params);
}

/// Manifest item
@immutable
@sealed
class ManifestItem {
  ManifestItem({
    required this.name,
    required this.shortName,
    required this.equality,
    required this.fields,
  }) {
    check(shortName.isGenFieldName());
    check(name.isGenClassName());
  }

  /// full name, for example "WeatherRainy".
  final String name;

  /// lower short name, for example "rainy".
  final String shortName;

  /// equality.
  final ManifestEquality equality;

  /// fields.
  final List<ManifestField> fields;

  @override
  String toString() => 'Item{name: $name, shortName: $shortName,'
      ' equality: $equality, fields: $fields}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          shortName == other.shortName &&
          equality == other.equality &&
          listEquals(fields, other.fields);

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      shortName.hashCode ^
      equality.hashCode ^
      listHash(fields);
}

/// Manifest equality
enum ManifestEquality {
  data,
  identity,
  distinct,
}

/// Manifest field
@immutable
@sealed
class ManifestField {
  ManifestField({
    required this.name,
    required this.type,
  }) {
    check(name.isGenFieldName());
  }

  /// name, for example "direction".
  final String name;

  /// type.
  final ManifestType type;

  @override
  String toString() => 'Field{name: $name, type: $type}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestField &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode ^ type.hashCode;
}

/// Manifest type
///
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isNullable == other.isNullable;

  @override
  int get hashCode =>
      runtimeType.hashCode ^ name.hashCode ^ isNullable.hashCode;
}

/// Manifest param
///
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManifestParam &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          bound == other.bound;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode ^ bound.hashCode;
}
