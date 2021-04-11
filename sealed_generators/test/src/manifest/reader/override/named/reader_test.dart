import 'package:sealed_generators/src/manifest/reader/override/named/reader.dart';
import 'package:test/test.dart';

import '../../../../../utils/examples.dart';

void main() {
  group('class TypeOverrideNamedReader', () {
    test('initialization', () {
      final options = optionsDataSafe;
      final reader = TypeOverrideNamedReader(options);
      expect(reader.options, options);
    });

    group('method mapOverride', () {
      test('null-safe', () {
        final options = optionsDataSafe;
        final reader = TypeOverrideNamedReader(options);

        final m = {'name1': 'double?', 'name2': 'double'};
        final o = reader.mapOverride(m);
        final t1 = o.map['name1']!;
        expect(t1.name, equals('double'));
        expect(t1.isNullable, isTrue);

        final t2 = o.map['name2']!;
        expect(t2.name, equals('double'));
        expect(t2.isNullable, isFalse);
      });

      test('legacy', () {
        final options = optionsDataLegacy;
        final reader = TypeOverrideNamedReader(options);

        final m = {'name1': 'double?', 'name2': 'double'};
        final o = reader.mapOverride(m);
        final t1 = o.map['name1']!;
        expect(t1.name, equals('double'));
        expect(t1.isNullable, isTrue);

        final t2 = o.map['name2']!;
        expect(t2.name, equals('double'));
        // same behaviour in legacy
        expect(t2.isNullable, isFalse);
      });
    });
  });
}
