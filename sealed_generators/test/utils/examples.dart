import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';

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

const optionsDataSafe = Options(
  equality: SealedEquality.data,
  isNullSafe: true,
);

const optionsIdentitySafe = Options(
  equality: SealedEquality.identity,
  isNullSafe: true,
);

const optionsDistinctSafe = Options(
  equality: SealedEquality.distinct,
  isNullSafe: true,
);

const optionsDataLegacy = Options(
  equality: SealedEquality.data,
  isNullSafe: false,
);

const optionsIdentityLegacy = Options(
  equality: SealedEquality.identity,
  isNullSafe: false,
);

const optionsDistinctLegacy = Options(
  equality: SealedEquality.distinct,
  isNullSafe: false,
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

String code1(String str) => '''
@Sealed($str)
abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}
''';
