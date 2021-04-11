import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/legacy_fixer.dart';
import 'package:sealed_generators/src/manifest/reader/override/dyn/model.dart';
import 'package:test/test.dart';

void main() {
  group('class OverrideDynamicLegacyFixer', () {
    test('method fix', () {
      final fixer = OverrideDynamicLegacyFixer();
      final tnn = ManifestType(name: 'double', isNullable: false);
      final tn = ManifestType(name: 'double', isNullable: true);
      final onn = TypeOverrideDynamic(type: tnn);
      final on = TypeOverrideDynamic(type: tn);

      final onnF = fixer.fix(onn);
      expect(onnF.type.name, equals('double'));
      expect(onnF.type.isNullable, isTrue);

      final onF = fixer.fix(on);
      expect(onF.type.name, equals('double'));
      expect(onF.type.isNullable, isTrue);
    });
  });
}
