import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:source_gen/source_gen.dart';
import 'package:super_enum_sealed_annotations/super_enum_sealed_annotations.dart';
import 'package:super_enum_sealed_generators/src/null_safety_reader.dart';

/// map super enum to dart sealed source
@sealed
@immutable
class Reader {
  /// for items using @generic and Generic
  ///
  /// we can not do anything better than making upper bound nullable.
  static final _paramGeneric = ManifestParam(
    name: 'Generic',
    bound: ManifestType(
      name: 'Object',
      isNullable: true,
    ),
  );

  const Reader();

  /// read source.
  Source read(Element element) => Source(
        manifest: _readManifest(element),
        options: _readOptions(element),
      );

  /// extract options.
  Options _readOptions(Element element) => Options(
        isNullSafe: const NullSafetyReader().readIsNullSafe(element),
      );

  /// extract manifest.
  Manifest _readManifest(Element element) {
    final en = element as EnumElementImpl;
    return Manifest(
      name: _readName(en),
      items: _readItems(en),
      params: _readParams(en),
    );
  }

  /// read items.
  List<ManifestItem> _readItems(EnumElementImpl en) =>
      en.constants.map(_readItem).toList();

  /// read an item.
  ManifestItem _readItem(FieldElement constant) {
    final read = _readFields(constant);
    return ManifestItem(
      shortName: constant.name.toLowerStart(),
      name: constant.name,
      equality: ManifestEquality.data,
      fields: read.fields,
      isWrapped: read.isWrapped,
    );
  }

  /// read fields.
  ///
  /// first try to use [UseClass] then
  /// try to use [Data]
  /// then assume this field is [object].
  _ReadFields _readFields(FieldElement constant) {
    final use = _filterMetadata<UseClass>(constant).firstOrNull;
    if (use != null) {
      return _ReadFields([_readFieldFromUseClass(use)], true);
    } else {
      final data = _filterMetadata<Data>(constant).firstOrNull;
      if (data != null) {
        return _ReadFields(_readFieldsFromData(data), false);
      } else {
        return _ReadFields(const [], true);
      }
    }
  }

  /// read type parameters.
  List<ManifestParam> _readParams(EnumElementImpl en) =>
      _readIsGeneric(en) ? [_paramGeneric] : const [];

  /// read name.
  // ! do not remove this line !
  // ! there is weird error which removes this line unless !
  String _readName(EnumElementImpl en) => en.name.substring(1);

  /// is generic.
  bool _readIsGeneric(EnumElementImpl en) => en.constants
      .any((constant) => _filterMetadata<Generic>(constant).isNotEmpty);

  /// read [DataField] objects of a [Data] and map them to [ManifestField].
  List<ManifestField> _readFieldsFromData(ConstantReader data) =>
      _readDataFields(data).map(_readField).toList();

  /// read [DataField] objects of a item.
  ///
  /// assume all constants without any [Data]
  /// annotations as empty sealed classes.
  /// so it does not need to read [generic] annotations.
  List<DartObject> _readDataFields(ConstantReader data) =>
      data.read('fields').listValue;

  /// read a field from a [DataField] object.
  ManifestField _readField(DartObject obj) {
    // todo find a better approach !
    // type arguments are inaccessible from obj.type, so:
    var name = obj.type!.getDisplayString(withNullability: false);
    name = name.substring('DataField<'.length);
    name = name.substring(0, name.length - '>'.length);

    return ManifestField(
      name: ConstantReader(obj).read('name').stringValue,
      type: ManifestType(
        name: name,
        isNullable: !ConstantReader(obj).read('required').boolValue,
      ),
    );
  }

  /// filter metadata by type.
  List<ConstantReader> _filterMetadata<T>(Element element) =>
      TypeChecker.fromRuntime(T)
          .annotationsOf(element)
          .map((e) => ConstantReader(e))
          .toList();

  /// read [UseClass] annotation.
  ///
  /// we read [type] field and discard [name] field.
  ///
  /// we use `data` as field name.
  ///
  /// we assume UseClass data to be non nullable.
  ManifestField _readFieldFromUseClass(ConstantReader use) => ManifestField(
        name: 'data',
        type: ManifestType(
          name: _readUseClassTypeName(use),
          isNullable: false,
        ),
      );

  /// read [type] filed of [UseClass] and return it's name.
  String _readUseClassTypeName(ConstantReader use) =>
      use.read('type').typeValue.getDisplayString(withNullability: false);
}

/// model class
class _ReadFields {
  final List<ManifestField> fields;
  final bool isWrapped;

  const _ReadFields(this.fields, this.isWrapped);

  @override
  String toString() => '_ReadFields{fields: $fields, isWrapped: $isWrapped}';
}
