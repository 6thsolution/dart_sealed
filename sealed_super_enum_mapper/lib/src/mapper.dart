import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/options/reader/null_safety_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward/backward_writer.dart';
import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:source_gen/source_gen.dart';

/// map super enum to dart sealed
@sealed
@immutable
class Mapper {
  /// for items using @generic and Generic
  static final _paramGeneric = ManifestParam(
    name: 'Generic',
    bound: ManifestType(name: 'Object', isNullable: true),
  );

  const Mapper();

  /// map
  @nonVirtual
  String map(Element element) => _writeSource(
        Source(
          manifest: _readManifest(element),
          options: _readOptions(element),
        ),
      );

  /// write source
  String _writeSource(Source source) => [
        '// ignore_for_file: unused_element, unused_field',
        [
          r'/// substitute generated manifest for super enum',
          r'/// and remove "$" at the end of class name.',
          BackwardWriter(source).write(),
        ].joinLines(),
        SourceWriter(source).write(),
      ].joinMethods();

  /// extract options
  Options _readOptions(Element element) => Options(
        equality: Equality.data,
        isNullSafe: const NullSafetyReader().readIsNullSafe(element),
      );

  /// extract manifest
  Manifest _readManifest(Element element) {
    final en = element as EnumElementImpl;
    return Manifest(
      name: _readName(en),
      items: _readItems(en),
      params: _readParams(en),
    );
  }

  /// read items
  List<ManifestItem> _readItems(EnumElementImpl en) =>
      en.constants.map(_readItem).toList();

  /// read an item
  ManifestItem _readItem(FieldElement constant) => ManifestItem(
        name: constant.name,
        fields: _readFields(constant),
      );

  /// read fields
  List<ManifestField> _readFields(FieldElement constant) =>
      _readDataFields(constant.metadata).map(_readField).toList();

  /// read type parameters
  List<ManifestParam> _readParams(EnumElementImpl en) =>
      _readIsGeneric(en) ? [_paramGeneric] : const [];

  /// read name
  String _readName(EnumElementImpl en) => en.name.substring(1);

  /// find metas by name
  List<ConstantReader> _filterMetas(
    List<ElementAnnotation> metas,
    String name,
  ) =>
      metas
          .map((e) => e.computeConstantValue())
          .where(
              (e) => e?.type?.getDisplayString(withNullability: false) == name)
          .map((e) => ConstantReader(e))
          .toList();

  /// is generic
  bool _readIsGeneric(EnumElementImpl en) => en.constants
      .any((constant) => _filterMetas(constant.metadata, 'Generic').isNotEmpty);

  /// read DataField objects of a item
  List<DartObject> _readDataFields(List<ElementAnnotation> metas) =>
      _filterMetas(metas, 'ObjectClass').isNotEmpty
          ? const []
          : _filterMetas(metas, 'Data').first.read('fields').listValue;

  /// read a field from a DataField object
  ManifestField _readField(DartObject obj) => ManifestField(
        name: ConstantReader(obj).read('name').stringValue,
        type: ManifestType(
          name: obj.type!.typeArguments.first
              .getDisplayString(withNullability: false),
          isNullable: true,
        ),
      );
}
