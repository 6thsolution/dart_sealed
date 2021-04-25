import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
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
  });

  group('class ManifestItem', () {
    test('initialization', () {
      final type1 = ManifestType(name: 'double', isNullable: true);
      final field1 = ManifestField(name: 'angle', type: type1);
      final item1 = ManifestItem(
        shortName: 'windy',
        name: 'Lollipop',
        equality: Equality.identity,
        fields: [],
      );
      final item2 = ManifestItem(
        shortName: 'windy',
        name: 'Candy',
        equality: Equality.distinct,
        fields: [field1],
      );

      expect(item1.shortName, equals('windy'));
      expect(item1.name, equals('Lollipop'));
      expect(item1.equality, equals(Equality.identity));
      expect(item1.fields, isEmpty);
      expect(item2.shortName, equals('windy'));
      expect(item2.name, equals('Candy'));
      expect(item2.equality, equals(Equality.distinct));
      expect(item2.fields, contains(field1));

      expect(
        () => ManifestItem(
          shortName: 'Windy',
          name: 'Lollipop',
          equality: Equality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy',
          name: 'lollipop',
          equality: Equality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy?',
          name: 'Lollipop',
          equality: Equality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
      expect(
        () => ManifestItem(
          shortName: 'windy',
          name: '_Lollipop',
          equality: Equality.identity,
          fields: [],
        ),
        throwsInternal(),
      );
    });
  });

  group('class Manifest', () {
    test('initialization', () {
      final item = ManifestItem(
        shortName: 'sunny',
        name: 'Lollipop',
        equality: Equality.identity,
        fields: [],
      );
      final manifest = Manifest(name: 'Weather', items: [item]);
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
        () => Manifest(name: 'weather', items: [item]),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: 'Weather?', items: [item]),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: 'Weather', items: []),
        throwsInternal(),
      );
      expect(
        () => Manifest(name: '_Weather', items: []),
        throwsInternal(),
      );
    });
  });
}
