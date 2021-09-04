part of 'examples.dart';

Manifest manifest3() => Manifest(
      name: 'Common',
      items: [
        ManifestItem(
          shortName: 'one',
          name: 'One',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'x',
              type: ManifestType(
                name: 'num',
                isNullable: false,
              ),
            ),
          ],
        ),
        ManifestItem(
          shortName: 'two',
          name: 'Two',
          equality: ManifestEquality.data,
          fields: [
            ManifestField(
              name: 'x',
              type: ManifestType(
                name: 'int',
                isNullable: false,
              ),
            ),
            ManifestField(
              name: 'y',
              type: ManifestType(
                name: 'String',
                isNullable: false,
              ),
            ),
          ],
        ),
      ],
      params: [],
      fields: [
        ManifestField(
          name: 'x',
          type: ManifestType(
            name: 'num',
            isNullable: false,
          ),
        ),
      ],
    );

final manifest3Data = manifest3();

final code3Data = code3();

String code3() => '''@Sealed()
abstract class _Common
{
num get x;

@WithEquality(Equality.data)
@WithName('One')
void one(num x);

@WithEquality(Equality.data)
@WithName('Two')
void two(int x, String y);
}''';

final doc3Data = doc3();

String doc3() => '''/// [Common] {
/// 
/// {[num] x}
/// 
/// ([One] one){[num] x} with data equality
/// 
/// ([Two] two){[int] x, [String] y} with data equality
/// 
/// }''';
