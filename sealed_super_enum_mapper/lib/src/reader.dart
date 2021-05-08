import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/options/reader/null_safety_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:sealed_generators/src/utils/list_utils.dart';
import 'package:sealed_generators/src/utils/name_utils.dart';
import 'package:source_gen/source_gen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:super_enum/super_enum.dart';

/// map super enum to dart sealed source
@sealed
@immutable
class Reader {
  /// for items using @generic and Generic
  static final _paramGeneric = ManifestParam(
    name: 'Generic',
    bound: ManifestType(name: 'Object', isNullable: true),
  );

  const Reader();

  /// read source
  @nonVirtual
  Source read(Element element) => Source(
        manifest: _readManifest(element),
        options: _readOptions(element),
      );

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
  ///
  /// first try to use [UseClass] then
  /// try to use [Data]
  /// then assume this field is [object].
  List<ManifestField> _readFields(FieldElement constant) {
    final use = _filterMetadata<UseClass>(constant).firstOrNull;
    if (use != null) {
      return [_readFieldFromUseClass(use)];
    } else {
      final data = _filterMetadata<Data>(constant).firstOrNull;
      if (data != null) {
        return _readFieldsFromData(data);
      } else {
        return const [];
      }
    }
  }

  /// read type parameters
  List<ManifestParam> _readParams(EnumElementImpl en) =>
      _readIsGeneric(en) ? [_paramGeneric] : const [];

  /// read name
  // ! do not remove this line !
  String _readName(EnumElementImpl en) => en.name.substring(1);

  /// is generic
  bool _readIsGeneric(EnumElementImpl en) => en.constants
      .any((constant) => _filterMetadata<Generic>(constant).isNotEmpty);

  /// read [DataField] objects of a [Data] and map them to [ManifestField].
  List<ManifestField> _readFieldsFromData(ConstantReader data) =>
      _readDataFields(data).map(_readField).toList();

  /// read [DataField] objects of a item
  ///
  /// assume all constants without any [Data]
  /// annotations as empty sealed classes.
  /// so it does not need to read [generic] annotations.
  List<DartObject> _readDataFields(ConstantReader data) =>
      data.read('fields').listValue;

  /// read a field from a [DataField] object
  ManifestField _readField(DartObject obj) => ManifestField(
        name: ConstantReader(obj).read('name').stringValue,
        type: ManifestType(
          name: obj.type!.typeArguments.first
              .getDisplayString(withNullability: false),
          isNullable:
              !(ConstantReader(obj).peek('required')?.boolValue ?? false),
        ),
      );

  /// filter metadata by type
  List<ConstantReader> _filterMetadata<T>(Element element) =>
      TypeChecker.fromRuntime(T)
          .annotationsOf(element)
          .map((e) => ConstantReader(e))
          .toList();

  /// read [UseClass] annotation
  ///
  /// we read [type] field and discard [name] field.
  ///
  /// we use `data` as field name.
  ManifestField _readFieldFromUseClass(ConstantReader use) => ManifestField(
        name: 'data',
        type: ManifestType(
          name: _readUseClassTypeName(use),
          isNullable: true,
        ),
      );

  /// read [type] filed of [UseClass] and return it's name.
  String _readUseClassTypeName(ConstantReader use) =>
      use.read('type').typeValue.getDisplayString(withNullability: false);
}
