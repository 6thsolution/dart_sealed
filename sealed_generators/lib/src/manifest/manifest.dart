import 'package:meta/meta.dart';

@immutable
@sealed
class Manifest {
  Manifest({
    required this.name,
    required this.items,
  });

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
  });

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
  });

  /// name, for example "direction"
  final String name;

  /// type, for example "double" or "double?"
  final String type;

  @override
  String toString() => 'ManifestField{name: $name, type: $type}';
}
