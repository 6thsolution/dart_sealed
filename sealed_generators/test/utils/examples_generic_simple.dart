part of 'examples.dart';

final manifest2 = Manifest(
  name: 'Result',
  params: [
    ManifestParam(
      name: 'T',
      bound: ManifestType(name: 'num', isNullable: false),
    ),
  ],
  items: [
    ManifestItem(
      name: 'Success',
      fields: [
        ManifestField(
          name: 'data',
          type: ManifestType(name: 'T', isNullable: false),
        ),
      ],
    ),
    ManifestItem(
      name: 'Error',
      fields: [
        ManifestField(
          name: 'exception',
          type: ManifestType(name: 'Object', isNullable: false),
        ),
      ],
    ),
  ],
);

final source2DataSafe = Source(
  options: optionsDataSafe,
  manifest: manifest2,
);
final source2IdentitySafe = Source(
  options: optionsIdentitySafe,
  manifest: manifest2,
);
final source2DistinctSafe = Source(
  options: optionsDistinctSafe,
  manifest: manifest2,
);
final source2DataLegacy = Source(
  options: optionsDataLegacy,
  manifest: manifest2,
);
final source2IdentityLegacy = Source(
  options: optionsIdentityLegacy,
  manifest: manifest2,
);
final source2DistinctLegacy = Source(
  options: optionsDistinctLegacy,
  manifest: manifest2,
);

final code2Default = code2('');
final code2Data = code2('equality: SealedEquality.data');
final code2Identity = code2('equality: SealedEquality.identity');
final code2Distinct = code2('equality: SealedEquality.distinct');

String code2(String str) => '''@Sealed($str)
abstract class _Result$_conflict<T extends num>
{
void success(T data);
void error(Object exception);
}''';

final doc2Data = doc2('data');
final doc2Identity = doc2('identity');
final doc2Distinct = doc2('distinct');

String doc2(String equality) => '''/// Result<T extends num> {
/// 
/// Success(T data)
/// 
/// Error(Object exception)
/// 
/// }
/// 
/// with $equality equality.''';
