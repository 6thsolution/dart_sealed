import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/overrider.dart';
import 'package:test/test.dart';

void main() {
  group('class TypeOverriderDynamic', () {
    test('initialization', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final o = TypeOverrideDynamic(type: t);
      final a = TypeOverriderDynamic(o);
      expect(a.override, equals(o));
    });

    test('method isDynamic', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final o = TypeOverrideDynamic(type: t);
      final a = TypeOverriderDynamic(o);

      final td1 = ManifestType(name: 'dynamic', isNullable: false);
      final td2 = ManifestType(name: 'dynamic', isNullable: true);
      expect(a.isDynamic(td1), isTrue);
      expect(a.isDynamic(td2), isTrue);
      expect(a.isDynamic(t), isFalse);
    });

    test('method mapField', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final o = TypeOverrideDynamic(type: t);
      final a = TypeOverriderDynamic(o);
      final td = ManifestType(name: 'dynamic', isNullable: true);
      final t2 = ManifestType(name: 'int', isNullable: true);
      final f1 = ManifestField(name: 'name1', type: td);
      final f2 = ManifestField(name: 'name2', type: t2);

      final f1m = a.mapField(f1);
      expect(f1m.name, 'name1');
      expect(f1m.type, t);

      final f2m = a.mapField(f2);
      expect(f2m.name, 'name2');
      expect(f2m.type, t2);
    });

    test('method apply', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final o = TypeOverrideDynamic(type: t);
      final a = TypeOverriderDynamic(o);
      final td = ManifestType(name: 'dynamic', isNullable: true);
      final t2 = ManifestType(name: 'int', isNullable: true);
      final f1 = ManifestField(name: 'name1', type: td);
      final f2 = ManifestField(name: 'name2', type: t2);
      final list = [f1, f2];

      final listA = a.apply(list);
      expect(listA, hasLength(equals(2)));

      final f1m = listA[0];
      expect(f1m.name, 'name1');
      expect(f1m.type, t);

      final f2m = listA[1];
      expect(f2m.name, 'name2');
      expect(f2m.type, t2);
    });
  });
}
