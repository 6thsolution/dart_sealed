part of 'examples.dart';

Manifest manifest2([ManifestEquality equality = ManifestEquality.data]) =>
    Manifest(
      name: 'Result',
      params: [
        ManifestParam(
          name: 'T',
          bound: ManifestType(name: 'num', isNullable: false),
        ),
      ],
      items: [
        ManifestItem(
          shortName: 'success',
          name: 'MySuccess',
          equality: equality,
          fields: [
            ManifestField(
              name: 'data',
              type: ManifestType(name: 'T', isNullable: false),
            ),
          ],
        ),
        ManifestItem(
          shortName: 'error',
          name: 'HelloError',
          equality: equality,
          fields: [
            ManifestField(
              name: 'exception',
              type: ManifestType(name: 'Object', isNullable: false),
            ),
          ],
        ),
      ],
      fields: [],
    );

final manifest2Data = manifest2(ManifestEquality.data);
final manifest2Identity = manifest2(ManifestEquality.identity);
final manifest2Distinct = manifest2(ManifestEquality.distinct);

final code2Data = code2(ManifestEquality.data);
final code2Identity = code2(ManifestEquality.identity);
final code2Distinct = code2(ManifestEquality.distinct);

String code2(ManifestEquality equality) => '''@Sealed()
abstract class _Result<T extends num>
{
@WithEquality(${_equality(equality)})
@WithName('MySuccess')
void success(T data);

@WithEquality(${_equality(equality)})
@WithName('HelloError')
void error(Object exception);
}''';

final doc2Data = doc2('data');
final doc2Identity = doc2('identity');
final doc2Distinct = doc2('distinct');

String doc2(String equality) => '''/// [Result]<[T] extends [num]> {
/// 
/// ([MySuccess] success){[T] data} with $equality equality
/// 
/// ([HelloError] error){[Object] exception} with $equality equality
/// 
/// }''';
