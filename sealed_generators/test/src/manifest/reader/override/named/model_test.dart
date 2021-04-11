import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';
import 'package:test/test.dart';

void main() {
  group('class TypeOverrideDynamic', () {
    test('initialization', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final m = {'name': t};
      final o = TypeOverrideNamed(map: m);
      expect(o.map, equals(m));
    });
  });
}
