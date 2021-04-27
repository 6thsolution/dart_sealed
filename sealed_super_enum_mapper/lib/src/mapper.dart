import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/options/reader/null_safety_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/source/writer/backward/backward_writer.dart';
import 'package:sealed_generators/src/source/writer/source_writer.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:sealed_generators/src/utils/string_utils.dart';
import 'package:source_gen/source_gen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:super_enum/super_enum.dart';

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
        shortName: constant.name.toLowerStart(),
        name: constant.name,
        equality: Equality.data,
        fields: _readFields(constant),
      );

  /// read fields
  List<ManifestField> _readFields(FieldElement constant) =>
      _readDataFields(constant).map(_readField).toList();

  /// read type parameters
  List<ManifestParam> _readParams(EnumElementImpl en) =>
      _readIsGeneric(en) ? [_paramGeneric] : const [];

  /// read name
  String _readName(EnumElementImpl en) => en.name.substring(1);

  /// is generic
  bool _readIsGeneric(EnumElementImpl en) => en.constants
      .any((constant) => _filterMetadata<Generic>(constant).isNotEmpty);

  /// read DataField objects of a item
  ///
  /// assume all constants without any Data annotations as empty sealed classes.
  List<DartObject> _readDataFields(FieldElement constant) =>
      _filterMetadata<Data>(constant).firstOrNull?.read('fields').listValue ??
      const [];

  /// read a field from a DataField object
  ManifestField _readField(DartObject obj) => ManifestField(
        name: ConstantReader(obj).read('name').stringValue,
        type: ManifestType(
          name: obj.type!.typeArguments.first
              .getDisplayString(withNullability: false),
          isNullable: true,
        ),
      );

  /// filter metadata by type
  List<ConstantReader> _filterMetadata<T>(Element element) =>
      TypeChecker.fromRuntime(T)
          .annotationsOf(element)
          .map((e) => ConstantReader(e))
          .toList();
}
