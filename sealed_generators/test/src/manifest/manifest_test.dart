import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:test/test.dart';

void main() {
  group('class ManifestField', () {
    test('initialization', () {
      final a = ManifestField(name: 'angle', type: 'double');
      expect(a.name, 'angle');
      expect(a.type, 'double');

      final b = ManifestField(name: 'angle', type: 'double?');
      expect(b.name, 'angle');
      expect(b.type, 'double?');

      expect(
        () => ManifestField(name: 'Angle', type: 'double'),
        throwsA(anything),
      );
    });
  });

  group('class ManifestItem', () {
    test('initialization', () {
      final field1 = ManifestField(name: 'angle', type: 'double');
      final item1 = ManifestItem(name: 'Windy', fields: []);
      final item2 = ManifestItem(name: 'Windy', fields: [field1]);

      expect(item1.name, equals('Windy'));
      expect(item1.fields, isEmpty);
      expect(item2.name, equals('Windy'));
      expect(item2.fields, contains(field1));

      expect(
        () => ManifestItem(name: 'windy', fields: []),
        throwsA(anything),
      );
      expect(
        () => ManifestItem(name: 'Windy?', fields: []),
        throwsA(anything),
      );
    });
  });

  group('class Manifest', () {
    test('initialization', () {
      final item = ManifestItem(name: 'Sunny', fields: []);
      final manifest = Manifest(name: 'Weather', items: [item]);

      expect(manifest.name, equals('Weather'));
      expect(manifest.items, contains(item));

      expect(
        () => Manifest(name: 'weather', items: [item]),
        throwsA(anything),
      );
      expect(
        () => Manifest(name: 'Weather?', items: [item]),
        throwsA(anything),
      );
      expect(
        () => Manifest(name: 'Weather', items: []),
        throwsA(anything),
      );
    });
  });
}
