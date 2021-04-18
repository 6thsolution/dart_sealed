part of 'examples.dart';

Manifest manifest2(Equality equality) => Manifest(
      name: 'Result',
      params: [
        ManifestParam(
          name: 'T',
          bound: ManifestType(name: 'num', isNullable: false),
        ),
      ],
      items: [
        ManifestItem(
          shortName: 'Success',
          fullName: 'ResultSuccess',
          equality: equality,
          fields: [
            ManifestField(
              name: 'data',
              type: ManifestType(name: 'T', isNullable: false),
            ),
          ],
        ),
        ManifestItem(
          shortName: 'Error',
          fullName: 'HelloError',
          equality: equality,
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
  options: optionsSafe,
  manifest: manifest2(Equality.data),
);
final source2IdentitySafe = Source(
  options: optionsSafe,
  manifest: manifest2(Equality.identity),
);
final source2DistinctSafe = Source(
  options: optionsSafe,
  manifest: manifest2(Equality.distinct),
);
final source2DataLegacy = Source(
  options: optionsLegacy,
  manifest: manifest2(Equality.data),
);
final source2IdentityLegacy = Source(
  options: optionsLegacy,
  manifest: manifest2(Equality.identity),
);
final source2DistinctLegacy = Source(
  options: optionsLegacy,
  manifest: manifest2(Equality.distinct),
);

final code2Data = code2(Equality.data);
final code2Identity = code2(Equality.identity);
final code2Distinct = code2(Equality.distinct);

String code2(Equality equality) => '''@Sealed()
abstract class _Result\$<T extends num>
{
@Meta(name: 'ResultSuccess', equality: $equality)
void success(T data);

@Meta(name: 'HelloError', equality: $equality)
void error(Object exception);
}''';

final doc2Data = doc2('data');
final doc2Identity = doc2('identity');
final doc2Distinct = doc2('distinct');

String doc2(String equality) => '''/// Result<T extends num> {
/// 
/// (ResultSuccess success){T data} with $equality equality
/// 
/// (HelloError error){Object exception} with $equality equality
/// 
/// }''';
