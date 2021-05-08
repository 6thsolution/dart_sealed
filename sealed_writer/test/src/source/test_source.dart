import 'package:sealed_writer/src/source/source.dart';
import 'package:test/test.dart';

import '../../utils/examples.dart';

void main() {
  group('class Source', () {
    test('initialization', () {
      final options = optionsSafe;
      final manifest = manifest1();
      final source = Source(options: options, manifest: manifest);
      expect(source.options, options);
      expect(source.manifest, manifest);
    });

    test('toString', () {
      final m1 = manifest1();
      final o1 = optionsSafe;
      final a = Source(options: o1, manifest: m1);

      expect(
        a.toString(),
        equals('Source{options: $o1, manifest: $m1}'),
      );
    });

    test('equality', () {
      final m1 = manifest1();
      final m2 = manifest2();
      final o1 = optionsSafe;
      final o2 = optionsLegacy;
      final a = Source(options: o1, manifest: m1);
      final b = Source(options: o1, manifest: m1);
      final c = Source(options: o2, manifest: m1);
      final d = Source(options: o1, manifest: m2);

      expect(a, equals(a));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test('hashCode', () {
      final m1 = manifest1();
      final m2 = manifest2();
      final o1 = optionsSafe;
      final o2 = optionsLegacy;
      final a = Source(options: o1, manifest: m1);
      final b = Source(options: o1, manifest: m1);
      final c = Source(options: o2, manifest: m1);
      final d = Source(options: o1, manifest: m2);

      expect(a.hashCode, equals(a.hashCode));
      expect(a.hashCode, equals(b.hashCode));
      expect(a.hashCode, isNot(equals(c.hashCode)));
      expect(a.hashCode, isNot(equals(d.hashCode)));
    });
  });
}
