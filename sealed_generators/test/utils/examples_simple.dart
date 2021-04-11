part of 'examples.dart';

final manifest1 = Manifest(
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

final source1DataSafe = Source(
  options: optionsDataSafe,
  manifest: manifest1,
);
final source1IdentitySafe = Source(
  options: optionsIdentitySafe,
  manifest: manifest1,
);
final source1DistinctSafe = Source(
  options: optionsDistinctSafe,
  manifest: manifest1,
);
final source1DataLegacy = Source(
  options: optionsDataLegacy,
  manifest: manifest1,
);
final source1IdentityLegacy = Source(
  options: optionsIdentityLegacy,
  manifest: manifest1,
);
final source1DistinctLegacy = Source(
  options: optionsDistinctLegacy,
  manifest: manifest1,
);

final code1Default = code1('');
final code1Data = code1('equality: SealedEquality.data');
final code1Identity = code1('equality: SealedEquality.identity');
final code1Distinct = code1('equality: SealedEquality.distinct');

const _conflict = BackwardWriter.avoidConflict ? '\$' : '';

String code1(String str) => '''@Sealed($str)
abstract class _Weather$_conflict
{
void sunny();
void rainy(int rain);
void windy(double velocity, double? angle);
}''';

final doc1Data = doc1('data');
final doc1Identity = doc1('identity');
final doc1Distinct = doc1('distinct');

String doc1(String equality) => '''/// Weather {
/// 
/// Sunny()
/// 
/// Rainy(int rain)
/// 
/// Windy(double velocity, double? angle)
/// 
/// }
/// 
/// with $equality equality.''';
