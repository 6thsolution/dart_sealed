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
        ManifestField(name: 'rain', type: 'int'),
      ],
    ),
    ManifestItem(
      name: 'Windy',
      fields: [
        ManifestField(name: 'velocity', type: 'double'),
        ManifestField(name: 'angle', type: 'double?')
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
