import 'package:sealed_writer/sealed_writer.dart';
import 'package:super_enum_sealed_generators/src/reader.dart';
import 'package:test/test.dart';

import 'utils/read_utils.dart';

const optionsSafe = Options(isNullSafe: true);
const optionsLegacy = Options(isNullSafe: false);

void main() {
  group('source reader', () {
    group('should success if', () {
      group('null-safe', () {
        group('simple', () {
          test('basic', () async {
            final element = await resolveSuperSafe('''
@superEnum
enum _Basic {
  @object
  One,
  @Data(fields: [
    DataField<int>('x', required: true),
    DataField<double>('y', required: false),
  ])
  Two,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'int',
                            isNullable: false,
                          ),
                        ),
                        ManifestField(
                          name: 'y',
                          type: ManifestType(
                            name: 'double',
                            isNullable: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });

          test('with UseClass', () async {
            final element = await resolveSuperSafe('''
@superEnum
enum _Basic {
  @object
  One,
  @UseClass(int)
  Two,
  @UseClass(double, name: 'hello')
  Three,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'data',
                          type: ManifestType(
                            name: 'int',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                    ManifestItem(
                      name: 'Three',
                      shortName: 'three',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'data',
                          type: ManifestType(
                            name: 'double',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });

        group('generic', () {
          test('basic', () async {
            final element = await resolveSuperSafe('''
@superEnum
enum _Basic {
  @generic
  @Data(fields: [
    DataField<Generic>('x'),
  ])
  One,
  @Data(fields: [
    DataField<Object>('y', required: false),
  ])
  Two,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [
                    ManifestParam(
                      name: 'Generic',
                      bound: ManifestType(
                        name: 'Object',
                        isNullable: true,
                      ),
                    ),
                  ],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'Generic',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'y',
                          type: ManifestType(
                            name: 'Object',
                            isNullable: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
      });

      group('legacy', () {
        group('simple', () {
          test('basic', () async {
            final element = await resolveSuperLegacy('''
@superEnum
enum _Basic {
  @object
  One,
  @Data(fields: [
    DataField<int>('x', required: true),
    DataField<double>('y', required: false),
  ])
  Two,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'int',
                            isNullable: false,
                          ),
                        ),
                        ManifestField(
                          name: 'y',
                          type: ManifestType(
                            name: 'double',
                            isNullable: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });

          test('with UseClass', () async {
            final element = await resolveSuperLegacy('''
@superEnum
enum _Basic {
  @object
  One,
  @UseClass(int)
  Two,
  @UseClass(double, name: 'hello')
  Three,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'data',
                          type: ManifestType(
                            name: 'int',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                    ManifestItem(
                      name: 'Three',
                      shortName: 'three',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'data',
                          type: ManifestType(
                            name: 'double',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });

        group('generic', () {
          test('basic', () async {
            final element = await resolveSuperLegacy('''
@superEnum
enum _Basic {
  @generic
  @Data(fields: [
    DataField<Generic>('x'),
  ])
  One,
  @Data(fields: [
    DataField<Object>('y', required: false),
  ])
  Two,
}''');
            final reader = const Reader();
            final source = reader.read(element);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [
                    ManifestParam(
                      name: 'Generic',
                      bound: ManifestType(
                        name: 'Object',
                        isNullable: true,
                      ),
                    ),
                  ],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'Generic',
                            isNullable: false,
                          ),
                        ),
                      ],
                    ),
                    ManifestItem(
                      name: 'Two',
                      shortName: 'two',
                      equality: ManifestEquality.data,
                      fields: [
                        ManifestField(
                          name: 'y',
                          type: ManifestType(
                            name: 'Object',
                            isNullable: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
      });
    });
  });
}
