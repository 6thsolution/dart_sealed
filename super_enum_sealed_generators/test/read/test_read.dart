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
        });
      });

      group('legacy', () {});
    });
  });
}
