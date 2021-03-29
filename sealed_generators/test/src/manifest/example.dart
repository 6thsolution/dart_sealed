import 'package:sealed_generators/src/manifest/manifest.dart';

final mi1 = ManifestItem(name: 'Sunny', fields: []);
final mi2f1 = ManifestField(name: 'rain', type: 'int');
final mi2 = ManifestItem(name: 'Rainy', fields: [mi2f1]);
final mi3f1 = ManifestField(name: 'velocity', type: 'double');
final mi3f2 = ManifestField(name: 'angle', type: 'double?');
final mi3 = ManifestItem(name: 'Windy', fields: [mi3f1, mi3f2]);
final manifest = Manifest(name: 'Weather', items: [mi1, mi2, mi3]);

final code = '''abstract class _Weather {
  void sunny();

  void rainy(int rain);

  void windy(double velocity, double? angle);
}''';
