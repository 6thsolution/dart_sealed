import 'package:meta/meta.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';

@immutable
@sealed
class Manifest {
  Manifest({
    required this.name,
    required this.items,
    this.params = const <ManifestParam>[],
  })  : assert(name.isGenClassName()),
        assert(items.isNotEmpty);

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
  }) : assert(name.isGenClassName());

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
  }) : assert(name.startsWithLower());

  /// name, for example "direction".
  final String name;

  /// type.
  final ManifestType type;

  @override
  String toString() => 'Field{name: $name, type: $type}';
}

@immutable
@sealed
class ManifestType {
  static final defaultSuper = ManifestType(
    name: 'Object',
    isNullable: false,
  );

  ManifestType({
    required this.name,
    required this.isNullable,
  }) : assert(name.isGenTypeName());

  /// name without any ?, ! or *
  /// and their helpers like /*!*/ or /*?*/.
  ///
  /// for example "double". but
  /// can NOT be "double?".
  final String name;

  /// without considering null-safety.
  ///
  /// by default all legacy fields are nullable.
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
    required this.type,
    required this.upper,
  }) : assert(type.isNullable == false);

  /// type param itself like 'T'.
  /// can not be nullable.
  final ManifestType type;

  /// type param super type like 'Object?'
  final ManifestType upper;

  @override
  String toString() => 'Param{type: $type, upper: $upper}';
}
