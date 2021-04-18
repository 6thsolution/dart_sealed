import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:source_gen/source_gen.dart';

/// todo test read
///
/// read equality
@sealed
@immutable
class EqualityReader {
  const EqualityReader();

  /// read equality
  @nonVirtual
  Equality readEquality(ConstantReader obj) =>
      Equality.values[obj.read('index').intValue];
}
