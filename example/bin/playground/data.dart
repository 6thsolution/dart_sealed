import 'package:equatable/src/equatable_utils.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

class Apple {
  final int x;
  final double y;

  Apple(this.x, this.y);

  @protected
  List<Object?> get _props => [x, y];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Apple &&
          runtimeType == other.runtimeType &&
          equals(_props, other._props);

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode(_props);
}

void main() {
  final a = Apple(1, 2.0);
  final b = Apple(1, 2.0);
  final c = Apple(1, 2.1);

  print(a == a);
  print(a == b);
  print(a == c);
}
