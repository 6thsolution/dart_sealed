import 'package:sealed_writer/src/manifest/manifest.dart';
import 'package:test/test.dart';

import '../../utils/exception_utils.dart';

void main() {
  group('class ManifestType', () {
    test('initialization', () {
      final a = ManifestType(name: 'double', isNullable: true);
      expect(a.name, 'double');
      expect(a.isNullable, true);

      expect(
        () => ManifestType(name: 'double?', isNullable: true),
        throwsInternal(),
      );
    });

    test('toString', () {
      final a = ManifestType(name: 'double', isNullable: true);
      expect(
        a.toString(),
        equals('Type{name: double, isNullable: true}'),
      );
    });

    test('equality', () {
      final a = ManifestType(name: 'double', isNullable: true);
      final b = ManifestType(name: 'double', isNullable: true);
      final c = ManifestType(name: 'int', isNullable: true);
      final d = ManifestType(name: 'double', isNullable: false);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test('hashCode', () {
      final a = ManifestType(name: 'double', isNullable: true);
      final b = ManifestType(name: 'double', isNullable: true);
      final c = ManifestType(name: 'int', isNullable: true);
      final d = ManifestType(name: 'double', isNullable: false);

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
    });
  });

  group('class ManifestParam', () {
    test('initialization', () {
      final bound = ManifestType(name: 'num', isNullable: true);
      final param = ManifestParam(name: 'T', bound: bound);

      expect(param.name, 'T');
      expect(param.bound, bound);

      expect(
        () => ManifestParam(name: 'double?', bound: bound),
        throwsInternal(),
      );
    });

    test('toString', () {
      final bound = ManifestType(name: 'num', isNullable: true);
      final param = ManifestParam(name: 'T', bound: bound);
      expect(
        param.toString(),
        equals('Param{name: T, bound: $bound}'),
      );
    });

    test('equality', () {
      final bound1 = ManifestType(name: 'num', isNullable: true);
      final bound2 = ManifestType(name: 'num', isNullable: false);
      final a = ManifestParam(name: 'T', bound: bound1);
      final b = ManifestParam(name: 'T', bound: bound1);
      final c = ManifestParam(name: 'U', bound: bound1);
      final d = ManifestParam(name: 'T', bound: bound2);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test('hashCode', () {
      final bound1 = ManifestType(name: 'num', isNullable: true);
      final bound2 = ManifestType(name: 'num', isNullable: false);
      final a = ManifestParam(name: 'T', bound: bound1);
      final b = ManifestParam(name: 'T', bound: bound1);
      final c = ManifestParam(name: 'U', bound: bound1);
      final d = ManifestParam(name: 'T', bound: bound2);

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
    });
  });

  group('class ManifestField', () {
    test('initialization', () {
      final type = ManifestType(name: 'double', isNullable: true);
      final a = ManifestField(name: 'angle', type: type);
      expect(a.name, 'angle');
      expect(a.type, type);

      final b = ManifestField(name: 'angle', type: type);
      expect(b.name, 'angle');
      expect(b.type, type);

      expect(
        () => ManifestField(name: '_angle', type: type),
        throwsInternal(),
      );
      expect(
        () => ManifestField(name: 'Angle', type: type),
        throwsInternal(),
      );
    });

    test('toString', () {
      final type = ManifestType(name: 'double', isNullable: true);
      final a = ManifestField(name: 'angle', type: type);
      expect(
        a.toString(),
        equals('Field{name: angle, type: $type}'),
      );
    });

    test('equality', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final type2 = ManifestType(name: 'double', isNullable: false);
      final a = ManifestField(name: 'angle', type: type1);
      final b = ManifestField(name: 'angle', type: type1);
      final c = ManifestField(name: 'lollipop', type: type1);
      final d = ManifestField(name: 'angle', type: type2);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test('hashCode', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final type2 = ManifestType(name: 'double', isNullable: false);
      final a = ManifestField(name: 'angle', type: type1);
      final b = ManifestField(name: 'angle', type: type1);
      final c = ManifestField(name: 'lollipop', type: type1);
      final d = ManifestField(name: 'angle', type: type2);

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
    });
  });

  group('class ManifestItem', () {
    test('initialization', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final field1 = ManifestField(name: 'angle', type: type1);
      final item1 = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );
      final item2 = ManifestItem(
        shortName: 'windy',
        name: 'Candy',
        equality: ManifestEquality.distinct,
        fields: [field1],
      );

      expect(item1.shortName, equals('windy'));
      expect(item1.name, equals('Lollipop'));
      expect(item1.equality, equals(ManifestEquality.identity));
      expect(item1.fields, isEmpty);
      expect(item2.shortName, equals('windy'));
      expect(item2.name, equals('Candy'));
      expect(item2.equality, equals(ManifestEquality.distinct));
      expect(item2.fields, contains(field1));

      expect(
        () => ManifestItem(
          shortName: 'Windy',
          name: 'Lollipop',
          equality: ManifestEquality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy',
          name: 'lollipop',
          equality: ManifestEquality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy?',
          name: 'Lollipop',
          equality: ManifestEquality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy',
          name: '_Lollipop',
          equality: ManifestEquality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
    });

    test('toString', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final field1 = ManifestField(name: 'angle', type: type1);
      final a = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [field1],
      );
      expect(
        a.toString(),
        equals(
          'Item{name: Lollipop, shortName: windy,'
          ' equality: ManifestEquality.identity, fields: [$field1]}',
        ),
      );
    });

    test('equality', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final field1 = ManifestField(name: 'angle', type: type1);
      final a = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [field1],
      );
      final b = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [field1],
      );
      final c = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.data,
        fields: [field1],
      );
      final d = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test('hashCode', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final field1 = ManifestField(name: 'angle', type: type1);
      final a = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [field1],
      );
      final b = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [field1],
      );
      final c = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.data,
        fields: [field1],
      );
      final d = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
    });
  });

  group('class Manifest', () {
    test('initialization', () {
      final item = ManifestItem(
        shortName: 'sunny',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );
      final manifest = Manifest(name: 'Weather', items: [item], params: []);
      final upper = ManifestType(name: 'num', isNullable: true);
      final param = ManifestParam(name: 'T', bound: upper);
      final manifest2 = Manifest(
        name: 'Weather',
        items: [item],
        params: [param],
      );

      expect(manifest.name, equals('Weather'));
      expect(manifest.items, contains(item));
      expect(manifest.params, isEmpty);
      expect(manifest2.params, contains(param));

      expect(
        () => Manifest(name: 'weather', items: [item], params: []),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: 'Weather?', items: [item], params: []),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: 'Weather', items: [], params: []),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: '_Weather', items: [], params: []),
        throwsInternal(),
      );
    });

    test('toString', () {
      final item1 = ManifestItem(
        shortName: 'sunny',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );
      final bound1 = ManifestType(name: 'num', isNullable: true);
      final param1 = ManifestParam(name: 'T', bound: bound1);
      final a = Manifest(
        name: 'Weather',
        items: [item1],
        params: [param1],
      );
      expect(
        a.toString(),
        equals(
          'Manifest{name: Weather, items: [$item1], params: [$param1]}',
        ),
      );
    });

    test('equality', () {
      final item1 = ManifestItem(
        shortName: 'sunny',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );
      final item2 = ManifestItem(
        shortName: 'rainy',
        name: 'Lollipop',
        equality: ManifestEquality.data,
        fields: [],
      );
      final bound1 = ManifestType(name: 'num', isNullable: true);
      final param1 = ManifestParam(name: 'T', bound: bound1);
      final a = Manifest(
        name: 'Weather',
        items: [item1],
        params: [param1],
      );
      final b = Manifest(
        name: 'Weather',
        items: [item1],
        params: [param1],
      );
      final c = Manifest(
        name: 'Lollipop',
        items: [item1],
        params: [param1],
      );
      final d = Manifest(
        name: 'Weather',
        items: [item1, item2],
        params: [param1],
      );
      final e = Manifest(
        name: 'Weather',
        items: [item1],
        params: [],
      );

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
      expect(a, isNot(equals(e)));
    });

    test('hashCode', () {
      final item1 = ManifestItem(
        shortName: 'sunny',
        name: 'Lollipop',
        equality: ManifestEquality.identity,
        fields: [],
      );
      final item2 = ManifestItem(
        shortName: 'rainy',
        name: 'Lollipop',
        equality: ManifestEquality.data,
        fields: [],
      );
      final bound1 = ManifestType(name: 'num', isNullable: true);
      final param1 = ManifestParam(name: 'T', bound: bound1);
      final a = Manifest(
        name: 'Weather',
        items: [item1],
        params: [param1],
      );
      final b = Manifest(
        name: 'Weather',
        items: [item1],
        params: [param1],
      );
      final c = Manifest(
        name: 'Lollipop',
        items: [item1],
        params: [param1],
      );
      final d = Manifest(
        name: 'Weather',
        items: [item1, item2],
        params: [param1],
      );
      final e = Manifest(
        name: 'Weather',
        items: [item1],
        params: [],
      );

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
      expect(a.hashCode, isNot(equals(e.hashCode)));
    });
  });
}
