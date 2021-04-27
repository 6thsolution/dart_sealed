import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:source_gen/source_gen.dart';

/// resolve like [GeneratorForAnnotation]<[Sealed]>
Future<Iterable<AnnotatedElement>> resolveSealeds(
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
  s.writeln(r"import 'package:sealed_annotations/sealed_annotations.dart';");
  s.writeln();
  s.writeln(code);
  final source = s.toString();
  final id = AssetId('sealed_generators', 'lib/temporary.dart');
  final library = await resolveSource(
    source,
    (resolver) => resolver.libraryFor(id),
    inputId: id,
  );
  final checker = TypeChecker.fromRuntime(Sealed);
  final reader = LibraryReader(library);
  return reader.annotatedWith(checker);
}

/// resolve like [GeneratorForAnnotation]<[Sealed]>
///
/// or throw if not found!
Future<AnnotatedElement> resolveSealed(
  final String code, {
  required final bool isNullSafe,
}) async {
  final found = await resolveSealeds(code, isNullSafe: isNullSafe);
  return found.first;
}

/// resolve like [GeneratorForAnnotation]<[Sealed]>
///
/// for null-safe
///
/// or throw if not found!
Future<AnnotatedElement> resolveSealedSafe(String code) =>
    resolveSealed(code, isNullSafe: true);

/// resolve like [GeneratorForAnnotation]<[Sealed]>
///
/// for legacy
///
/// or throw if not found!
Future<AnnotatedElement> resolveSealedLegacy(String code) =>
    resolveSealed(code, isNullSafe: false);
