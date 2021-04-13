import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward/backward_writer.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:source_gen/source_gen.dart';

/// map
String map(Element element) => _write(_manifest(element));

String _write(Manifest manifest) {
  final options = Options(equality: SealedEquality.data, isNullSafe: true);
  final source = Source(manifest: manifest, options: options);
  final backwardWriter = BackwardWriter(source);
  final s = StringBuffer();
  s.writeln(r'/// substitute generated manifest for super enum');
  s.writeln(r'/// and remove "$" at the end of class name.');
  s.writeln(backwardWriter.write());
  return s.toString();
}

Manifest _manifest(Element element) {
  final en = element as EnumElementImpl;
  final name = en.name.substring(1);
  var generic = false;
  final items = <ManifestItem>[];
  for (final constant in en.constants) {
    final fields = <ManifestField>[];

    final genMeta = constant.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) => e?.type?.getDisplayString(withNullability: false) == 'Generic',
        )
        .toList()
        .firstOrNull;
    final objMeta = constant.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) =>
              e?.type?.getDisplayString(withNullability: false) ==
              'ObjectClass',
        )
        .toList()
        .firstOrNull;
    final dataMetas = constant.metadata
        .map((e) => e.computeConstantValue())
        .where(
          (e) => e?.type?.getDisplayString(withNullability: false) == 'Data',
        )
        .map((e) => ConstantReader(e))
        .toList();

    if (genMeta != null) generic = true;
    if (objMeta == null) {
      for (final obj in dataMetas.first.read('fields').listValue) {
        fields.add(ManifestField(
          name: ConstantReader(obj).read('name').stringValue,
          type: ManifestType(
            name: obj.type!.typeArguments.first
                .getDisplayString(withNullability: false),
            isNullable: false,
          ),
        ));
      }
    }

    items.add(ManifestItem(
      name: constant.name,
      fields: fields,
    ));
  }
  final params = generic
      ? [
          ManifestParam(
            name: 'Generic',
            bound: ManifestType(name: 'Object', isNullable: false),
          ),
        ]
      : <ManifestParam>[];
  final manifest = Manifest(
    name: name,
    items: items,
    params: params,
  );
  return manifest;
}
