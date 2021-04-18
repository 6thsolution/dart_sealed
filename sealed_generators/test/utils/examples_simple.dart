part of 'examples.dart';

Manifest manifest1(Equality equality) => Manifest(
      name: 'Weather',
      items: [
        ManifestItem(
          shortName: 'Sunny',
          fullName: 'HiSunny',
          equality: equality,
          fields: [],
        ),
        ManifestItem(
          shortName: 'Rainy',
          fullName: 'WeatherRainy',
          equality: equality,
          fields: [
            ManifestField(
              name: 'rain',
              type: ManifestType(name: 'int', isNullable: false),
            ),
          ],
        ),
        ManifestItem(
          shortName: 'Windy',
          fullName: 'HelloWindy',
          equality: equality,
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

final source1DataSafe = Source(
  options: optionsSafe,
  manifest: manifest1(Equality.data),
);
final source1IdentitySafe = Source(
  options: optionsSafe,
  manifest: manifest1(Equality.identity),
);
final source1DistinctSafe = Source(
  options: optionsSafe,
  manifest: manifest1(Equality.distinct),
);
final source1DataLegacy = Source(
  options: optionsLegacy,
  manifest: manifest1(Equality.data),
);
final source1IdentityLegacy = Source(
  options: optionsLegacy,
  manifest: manifest1(Equality.identity),
);
final source1DistinctLegacy = Source(
  options: optionsLegacy,
  manifest: manifest1(Equality.distinct),
);

final code1Data = code1(Equality.data);
final code1Identity = code1(Equality.identity);
final code1Distinct = code1(Equality.distinct);

String code1(Equality equality) => '''@Sealed()
abstract class _Weather\$
{
@Meta(name: 'HiSunny', equality: $equality)
void sunny();

@Meta(name: 'WeatherRainy', equality: $equality)
void rainy(int rain);

@Meta(name: 'HelloWindy', equality: $equality)
void windy(double velocity, double? angle);
}''';

final doc1Data = doc1('data');
final doc1Identity = doc1('identity');
final doc1Distinct = doc1('distinct');

String doc1(String equality) => '''/// Weather {
/// 
/// (HiSunny sunny){} with $equality equality
/// 
/// (WeatherRainy rainy){int rain} with $equality equality
/// 
/// (HelloWindy windy){double velocity, double? angle} with $equality equality
/// 
/// }''';
