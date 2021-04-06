// @dart=2.12

void main() {
  final c1 = C(10);
  final c2 = c1.copy(x: null);
  // final c3 = c1.copy(x: 1.5);
  print(c1);
  print(c2);

  final d1 = D(10);
  final d2 = d1.copy1(x: null);
  final d3 = d1.copy<num>(x: null);
  final d4 = d1.copy(x: 1.5);
  final d5 = d1.withX(1.5);
  print(d1);
  print(d2);
  print(d3);
  print(d4);
  print(d5);
}

class C<T extends num> {
  final T x;

  C(this.x);

  C<T> copy({T? x}) => C(x ?? this.x);

  @override
  String toString() => '$runtimeType{x: $x}';
}

class D<T extends num> {
  final T x;

  D(this.x);

  /// we can fix it like this
  /// but then type information is lost
  ///
  /// note: num? and U?
  D<num> copy<U extends num?>({U? x}) {
    num y;
    if (x != null) {
      //  Error: A value of type 'U' can't be assigned to a variable of type
      //  'num' because 'num?' is nullable and 'num' isn't.
      // y = x;

      // ignore: unnecessary_cast
      y = x as num;
    } else {
      y = this.x;
    }
    return D(y);
  }

  /// with type info loss
  D<num> copy1({num? x}) => D(x ?? this.x);

  D<U> withX<U extends num>(U x) => D(x);

  @override
  String toString() => '$runtimeType{x: $x}';
}

class Mixed<Tx extends num, Ty extends Object?> {
  final Tx x1;
  final Tx x2;
  final Ty? y;
  final int z;
  final double? w;

  Mixed(this.x1, this.x2, this.y, this.z, this.w);

// it can be only generated for simple usages
// Mixed<TxNew, Ty> withX1<TxNew extends num>(TxNew x1) =>
//     Mixed(x1, x2, y, z, w);

  /// with type info loss
  Mixed<num, Object?> withX1(num x1) => Mixed(x1, x2, y, z, w);
}
