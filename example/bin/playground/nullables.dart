// @dart=2.12

void main() {
  final x1 = Gen1('abc');
  final x2 = Gen2('abc');
  final x3 = Gen3('abc');
  final x4 = Gen4('abc');
  final xs = [x1, x2, x3, x4];
  xs.forEach(print);

  // final n1 = Gen1(null);
  final n2 = Gen2<String>(null);
  final n3 = Gen3(null);
  final n4 = Gen4(null);
  final ns = [n2, n3, n4];
  ns.forEach(print);
}

class Gen1<T extends String> {
  final T x;

  Gen1(this.x);

  @override
  String toString() => '$runtimeType{x: $x}';

  int? get a => x.length;

  int get b => x.length;
}

class Gen2<T extends String> {
  final T? x;

  Gen2(this.x);

  @override
  String toString() => '$runtimeType{x: $x}';

  int? get a => x?.length;

// int get b => x.length;
}

class Gen3<T extends String?> {
  final T x;

  Gen3(this.x);

  @override
  String toString() => '$runtimeType{x: $x}';

  int? get a => x?.length;

// int get b => x.length;
}

class Gen4<T extends String?> {
  final T? x;

  Gen4(this.x);

  @override
  String toString() => '$runtimeType{x: $x}';

  int? get a => x?.length;

// int get b => x.length;
}
