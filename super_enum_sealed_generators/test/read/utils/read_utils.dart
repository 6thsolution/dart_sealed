import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';

/// resolve like [GeneratorForAnnotation]<[SuperEnum]>
Future<Iterable<Element>> resolveSupers(
  final String code, {
  required final bool isNullSafe,
}) async {
  final s = StringBuffer();
  if (isNullSafe) {
    s.writeln('// @dart=2.12');
  } else {
    s.writeln('// @dart=2.9');
  }
  s.writeln('library temporary;');
  s.writeln();
  s.writeln(r"import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';");
  s.writeln();
  s.writeln(code);
  final source = s.toString();
  final id = AssetId('sealed_generators', 'lib/temporary.dart');
  final library = await resolveSource(
    source,
    (resolver) => resolver.libraryFor(id),
    inputId: id,
  );
  final checker = TypeChecker.fromRuntime(SuperEnum);
  final reader = LibraryReader(library);
  return reader.annotatedWith(checker).map((e) => e.element);
}

/// resolve like [GeneratorForAnnotation]<[SuperEnum]>
///
/// or throw if not found!
Future<Element> resolveSuper(
  final String code, {
  required final bool isNullSafe,
}) async {
  final founds = await resolveSupers(code, isNullSafe: isNullSafe);
  return founds.first;
}

/// resolve like [GeneratorForAnnotation]<[SuperEnum]>
///
/// for null-safe
///
/// or throw if not found!
Future<Element> resolveSuperSafe(String code) =>
    resolveSuper(code, isNullSafe: true);

/// resolve like [GeneratorForAnnotation]<[SuperEnum]>
///
/// for legacy
///
/// or throw if not found!
Future<Element> resolveSuperLegacy(String code) =>
    resolveSuper(code, isNullSafe: false);
