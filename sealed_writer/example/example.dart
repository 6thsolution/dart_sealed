import 'package:sealed_writer/sealed_writer.dart';

void main() {
  final source = Source(
    options: Options(isNullSafe: true),
    manifest: Manifest(
      name: 'Weather',
      items: [
        ManifestItem(
          name: 'WeatherSunny',
          shortName: 'sunny',
          equality: ManifestEquality.data,
          fields: [],
        ),
        ManifestItem(
          name: 'WeatherRainy',
          shortName: 'rainy',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'rain',
              type: ManifestType(
                name: 'int',
                isNullable: false,
              ),
            ),
          ],
        ),
      ],
      params: [],
    ),
  );

  final writer = BackwardWriter(source);

  print(writer.write());
}
