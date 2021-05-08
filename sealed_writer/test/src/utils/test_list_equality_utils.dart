import 'package:sealed_writer/src/utils/list_equality_utils.dart';
import 'package:test/test.dart';

void main() {
  test('method listEquals', () {
    expect(listEquals([1], [1, 2, 3]), isFalse);
    expect(listEquals([1, 2, 3], [1]), isFalse);
    expect(listEquals(<int>[], <int>[]), isTrue);
    expect(listEquals([1, 2, 3], [1, 2, 3]), isTrue);
    expect(listEquals([1, 2, 3], [1, 4, 3]), isFalse);

    expect(listEquals(['a', 'b'], ['a', 'b']), isTrue);
    expect(listEquals(['a', 'b'], ['a', 'c']), isFalse);
  });

  test('method listHash', () {
    expect(listHash([1, 2, 3]), equals(listHash([1, 2, 3])));
    expect(listHash([1, 2, 3]), isNot(equals(listHash([1]))));
    expect(listHash([1, 2, 3]), isNot(equals(listHash([1, 5, 3]))));
    expect(listHash(<int>[]), isNot(equals(listHash([0]))));
    expect(listHash([0]), isNot(equals(listHash([0, 0]))));

    expect(listHash(['a', 'b']), equals(listHash(['a', 'b'])));
    expect(listHash(['a', 'b']), isNot(equals(listHash(['a', 'c']))));
  });
}
