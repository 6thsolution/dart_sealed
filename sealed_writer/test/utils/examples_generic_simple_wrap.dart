part of 'examples.dart';

Manifest manifest4() => Manifest(
      name: 'Base',
      items: [
        ManifestItem(
          shortName: 'one',
          name: 'BaseOne',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'x',
              type: ManifestType(
                name: 'T',
                isNullable: false,
              ),
            ),
          ],
          isWrapped: true,
        ),
      ],
      params: [
        ManifestParam(
          name: 'T',
          bound: ManifestType(
            name: 'num',
            isNullable: false,
          ),
        ),
      ],
    );

final source4DataSafe = Source(
  options: optionsSafe,
  manifest: manifest4(),
);
final source4DataLegacy = Source(
  options: optionsLegacy,
  manifest: manifest4(),
);

final code4Data = code4();

String code4() => '''@Sealed()
abstract class _Base<T extends num>
{
@WithWrap
@WithEquality(Equality.data)
@WithName('BaseOne')
void one(T x);
}''';

final doc4Data = doc4();

String doc4() => '''/// [Base]<[T] extends [num]> {
/// 
/// ([BaseOne] one){[T] x} with data equality with wrap
/// 
/// }''';
