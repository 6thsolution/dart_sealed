import 'package:meta/meta.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/type_utils.dart';

@immutable
@sealed
class Manifest {
  Manifest({
    required this.name,
    required this.items,
  })   : assert(name.startWithUpper()),
        assert(name.isNonNullable()),
        assert(items.isNotEmpty);

  /// name, for example "WeatherState"
  final String name;

  /// items
  final List<ManifestItem> items;

  @override
  String toString() => 'Manifest{name: $name, items: $items}';
}

@immutable
@sealed
class ManifestItem {
  ManifestItem({
    required this.name,
    required this.fields,
  })   : assert(name.startWithUpper()),
        assert(name.isNonNullable());

  /// name, for example "Rainy"
  final String name;

  /// fields
  final List<ManifestField> fields;

  @override
  String toString() => 'ManifestItem{name: $name, fields: $fields}';
}

@immutable
@sealed
class ManifestField {
  ManifestField({
    required this.name,
    required this.type,
  }) : assert(name.startWithLower());

  /// name, for example "direction"
  final String name;

  /// type, for example "double" or "double?"
  final String type;

  @override
  String toString() => 'ManifestField{name: $name, type: $type}';
}
