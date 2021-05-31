part of 'examples.dart';

Manifest manifest3() => Manifest(
      name: 'Base',
      items: [
        ManifestItem(
          shortName: 'one',
          name: 'BaseOne',
          equality: ManifestEquality.data,
          fields: [],
          isWrapped: true,
        ),
        ManifestItem(
          shortName: 'two',
          name: 'BaseTwo',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'x',
              type: ManifestType(name: 'int', isNullable: false),
            ),
          ],
          isWrapped: true,
        ),
        ManifestItem(
          shortName: 'three',
          name: 'BaseThree',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'y',
              type: ManifestType(name: 'int', isNullable: false),
            ),
            ManifestField(
              name: 'z',
              type: ManifestType(name: 'int', isNullable: true),
            ),
          ],
          isWrapped: true,
        ),
      ],
      params: [],
    );

final source3DataSafe = Source(
  options: optionsSafe,
  manifest: manifest3(),
);
final source3DataLegacy = Source(
  options: optionsLegacy,
  manifest: manifest3(),
);

final code3Data = code3();

String code3() => '''@Sealed()
abstract class _Base\$
{
@WithWrap
@WithEquality(Equality.data)
@WithName('BaseOne')
void one();

@WithWrap
@WithEquality(Equality.data)
@WithName('BaseTwo')
void two(int x);

@WithWrap
@WithEquality(Equality.data)
@WithName('BaseThree')
void three(int y, int? z);
}''';

final doc3Data = doc3();

String doc3() => '''/// [Base] {
/// 
/// ([BaseOne] one){} with data equality with wrap
/// 
/// ([BaseTwo] two){[int] x} with data equality with wrap
/// 
/// ([BaseThree] three){[int] y, [int]? z} with data equality with wrap
/// 
/// }''';
