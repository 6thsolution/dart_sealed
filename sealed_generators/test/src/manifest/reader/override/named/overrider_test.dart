import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/overrider.dart';
import 'package:test/test.dart';

void main() {
  group('class TypeOverrideNamed', () {
    test('initialization', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final m = {'name': t};
      final o = TypeOverrideNamed(map: m);
      final a = TypeOverriderNamed(o);
      expect(a.override, equals(o));
    });

    test('method mapField', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final m = {'name1': t};
      final o = TypeOverrideNamed(map: m);
      final a = TypeOverriderNamed(o);
      final t1 = ManifestType(name: 'int', isNullable: true);
      final t2 = ManifestType(name: 'dynamic', isNullable: true);
      final f1 = ManifestField(name: 'name1', type: t1);
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
      final m = {'name1': t};
      final o = TypeOverrideNamed(map: m);
      final a = TypeOverriderNamed(o);
      final t1 = ManifestType(name: 'int', isNullable: true);
      final t2 = ManifestType(name: 'dynamic', isNullable: true);
      final f1 = ManifestField(name: 'name1', type: t1);
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
