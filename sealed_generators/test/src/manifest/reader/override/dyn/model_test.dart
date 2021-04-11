import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';
import 'package:test/test.dart';

void main() {
  group('class TypeOverrideDynamic', () {
    test('initialization', () {
      final t = ManifestType(name: 'double', isNullable: false);
      final o = TypeOverrideDynamic(type: t);
      expect(o.type, equals(t));
    });
  });
}
