import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/legacy_fixer.dart';
import 'package:sealed_generators/src/manifest/reader/override/named/model.dart';
import 'package:test/test.dart';

void main() {
  group('class OverrideNamedLegacyFixer', () {
    test('method fix', () {
      final fixer = OverrideNamedLegacyFixer();
      final tnn = ManifestType(name: 'int', isNullable: false);
      final tn = ManifestType(name: 'double', isNullable: true);
      final m = {
        'tnn': tnn,
        'tn': tn,
      };
      final o = TypeOverrideNamed(map: m);

      final of = fixer.fix(o);
      final mf = of.map;
      final tnnF = mf['tnn']!;
      final tnF = mf['tn']!;

      expect(tnnF.name, equals('int'));
      expect(tnnF.isNullable, isTrue);

      expect(tnF.name, equals('double'));
      expect(tnF.isNullable, isTrue);

      final oe = TypeOverrideNamed(map: {});
      final oeF = fixer.fix(oe);
      final meF = oeF.map;
      expect(meF, isEmpty);
    });
  });
}
