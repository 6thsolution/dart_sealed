import 'package:sealed_generators/src/manifest/manifest.dart';

final manifest = Manifest(
  name: 'Weather',
  items: [
    ManifestItem(
      name: 'Sunny',
      fields: [],
    ),
    ManifestItem(
      name: 'Rainy',
      fields: [
        ManifestField(
          name: 'rain',
          type: ManifestType(name: 'int', isNullable: false),
        ),
      ],
    ),
    ManifestItem(
      name: 'Windy',
      fields: [
        ManifestField(
          name: 'velocity',
          type: ManifestType(name: 'double', isNullable: false),
        ),
        ManifestField(
          name: 'angle',
          type: ManifestType(name: 'double', isNullable: true),
        )
      ],
    ),
  ],
);

final code = '''
@Sealed()
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
''';
