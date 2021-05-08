import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';
import 'package:test/test.dart';

import '../utils/type_utils.dart';

void main() {
  group('class SuperEnum', () {
    test('initialization', () {
      expect(superEnum, equals(superEnum));
      expect(superEnum, isA<SuperEnum>());
    });
  });

  group('class ObjectClass', () {
    test('initialization', () {
      expect(object, equals(object));
      expect(object, isA<ObjectClass>());
    });
  });

  group('class Generic', () {
    test('initialization', () {
      expect(generic, equals(generic));
      expect(generic, isA<Generic>());
    });
  });

  group('class DataField', () {
    test('initialization', () {
      const a = DataField('one', required: false);
      const b = DataField('two');
      expect(a.name, equals('one'));
      expect(a.required, isFalse);
      expect(b.name, equals('two'));
      expect(b.required, isTrue);
    });
  });

  group('class DataField', () {
    test('initialization', () {
      const a = DataField<int>('one', required: false);
      const b = DataField<double?>('two');
      expect(a.name, equals('one'));
      expect(a.required, isFalse);
      expect(a, hasType<DataField<int>>());
      expect(b.name, equals('two'));
      expect(b.required, isTrue);
      expect(b, hasType<DataField<double?>>());
    });
  });

  group('class Data', () {
    test('initialization', () {
      const a = DataField<int>('one');
      const b = Data(fields: [a]);
      expect(b.fields, contains(a));
    });
  });

  group('class UseClass', () {
    test('initialization', () {
      const a = UseClass(int, name: 'hello');
      const b = UseClass(double);
      expect(a.name, equals('hello'));
      expect(a.type, equals(int));
      expect(b.name, isNull);
      expect(b.type, equals(double));
    });
  });
}
