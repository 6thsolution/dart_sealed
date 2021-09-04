import 'package:sealed_generators/src/source/source_reader.dart';
import 'package:sealed_writer/sealed_writer.dart';
import 'package:test/test.dart';

import '../utils/exception_utils.dart';
import 'utils/read_utils.dart';

void main() {
  group('manifest reader', () {
    group('should success if', () {
      group('null-safe', () {
        group('simple', () {
          test('basic', () async {
            final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one();
void two(int x, double? y);
}''');
            final manifest = SourceReader().read(x.element);
            expect(
              manifest,
              Manifest(
                name: 'Basic',
                params: [],
                items: [
                  ManifestItem(
                    name: 'BasicOne',
                    shortName: 'one',
                    equality: ManifestEquality.data,
                    fields: [],
                  ),
                  ManifestItem(
                    name: 'BasicTwo',
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
            );
          });

          test('equality', () async {
            final x = await resolveSealedSafe('''
@Sealed()
@WithEquality(Equality.identity)
abstract class _Basic {
void one();
}''');
            final manifest = SourceReader().read(x.element);
            expect(
              manifest,
              Manifest(
                name: 'Basic',
                params: [],
                items: [
                  ManifestItem(
                    name: 'BasicOne',
                    shortName: 'one',
                    equality: ManifestEquality.identity,
                    fields: [],
                  ),
                ],
              ),
            );
          });

          group('meta', () {
            test('change name', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName('Hello')
void one();
}''');
              final reader = SourceReader();
              final manifest = reader.read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'Hello',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                  ],
                ),
              );
            });

            test('change equality', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithEquality(Equality.identity)
void one();
}''');
              final reader = SourceReader();
              final manifest = reader.read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: ManifestEquality.identity,
                      fields: [],
                    ),
                  ],
                ),
              );
            });

            test('change name and equality', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName('Hello')
@WithEquality(Equality.identity)
void one();
}''');
              final manifest = SourceReader().read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'Hello',
                      shortName: 'one',
                      equality: ManifestEquality.identity,
                      fields: [],
                    ),
                  ],
                ),
              );
            });

            test('change prefix', () async {
              final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix('Pre')
abstract class _Basic {
void one();
}''');
              final manifest = SourceReader().read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'PreOne',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                  ],
                ),
              );
            });

            test('empty prefix', () async {
              final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix('')
abstract class _Basic {
void one();
}''');
              final manifest = SourceReader().read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'One',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                  ],
                ),
              );
            });

            test('change prefix and name', () async {
              final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix('Pre')
abstract class _Basic {
@WithName('Hello')
void one();
}''');
              final reader = SourceReader();
              final manifest = reader.read(x.element);
              expect(
                manifest,
                Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'Hello',
                      shortName: 'one',
                      equality: ManifestEquality.data,
                      fields: [],
                    ),
                  ],
                ),
              );
            });
          });

          test('withType', () async {
            final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(@WithType('double?') x, @WithType('double') int? y);
}''');
            final manifest = SourceReader().read(x.element);
            expect(
              manifest,
              Manifest(
                name: 'Basic',
                params: [],
                items: [
                  ManifestItem(
                    name: 'BasicOne',
                    shortName: 'one',
                    equality: ManifestEquality.data,
                    fields: [
                      ManifestField(
                        name: 'x',
                        type: ManifestType(
                          name: 'double',
                          isNullable: true,
                        ),
                      ),
                      ManifestField(
                        name: 'y',
                        type: ManifestType(
                          name: 'double',
                          isNullable: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });

        group('generic', () {
          test('basic', () async {
            final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic<T extends num, E extends Object?> {
void one(T x);
void two(E y);
void three(T? z);
}''');
            final manifest = SourceReader().read(x.element);
            expect(
              manifest,
              Manifest(
                name: 'Basic',
                params: [
                  ManifestParam(
                    name: 'T',
                    bound: ManifestType(
                      name: 'num',
                      isNullable: false,
                    ),
                  ),
                  ManifestParam(
                    name: 'E',
                    bound: ManifestType(
                      name: 'Object',
                      isNullable: true,
                    ),
                  ),
                ],
                items: [
                  ManifestItem(
                    name: 'BasicOne',
                    shortName: 'one',
                    equality: ManifestEquality.data,
                    fields: [
                      ManifestField(
                        name: 'x',
                        type: ManifestType(
                          name: 'T',
                          isNullable: false,
                        ),
                      ),
                    ],
                  ),
                  ManifestItem(
                    name: 'BasicTwo',
                    shortName: 'two',
                    equality: ManifestEquality.data,
                    fields: [
                      ManifestField(
                        name: 'y',
                        type: ManifestType(
                          name: 'E',
                          isNullable: false,
                        ),
                      ),
                    ],
                  ),
                  ManifestItem(
                    name: 'BasicThree',
                    shortName: 'three',
                    equality: ManifestEquality.data,
                    fields: [
                      ManifestField(
                        name: 'z',
                        type: ManifestType(
                          name: 'T',
                          isNullable: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });

          test('default bound', () async {
            final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic<T> {
void one();
}''');
            final manifest = SourceReader().read(x.element);
            expect(
              manifest,
              Manifest(
                name: 'Basic',
                params: [
                  ManifestParam(
                    name: 'T',
                    bound: ManifestType(
                      name: 'Object',
                      isNullable: true,
                    ),
                  ),
                ],
                items: [
                  ManifestItem(
                    name: 'BasicOne',
                    shortName: 'one',
                    equality: ManifestEquality.data,
                    fields: [],
                  ),
                ],
              ),
            );
          });
        });
      });
    });

    group('should fail if', () {
      test('when is not nul-safe', () async {
        final x = await resolveSealedNonNullSafe('''
@Sealed()
abstract class _Basic {
void one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('upper method name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void One();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('lower class name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _basic {
void one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('upper field name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(int X);
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('non class element of enum', () async {
        final x = await resolveSealedSafe('''
@Sealed()
enum _Basic {
a, b, c,
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('non class element of method', () async {
        final x = await resolveSealedSafe('''
@Sealed()
void hello() {}
''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('public element', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class Basic {
void one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('private method', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void _one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('private method argument', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(int _x);
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('with super type', () async {
        final x = await resolveSealedSafe('''
class S {}

@Sealed()
abstract class _Basic extends S {
void one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('with super interface', () async {
        final x = await resolveSealedSafe('''
abstract class S {}

@Sealed()
abstract class _Basic implements S {
void one();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('with super type of Object', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic extends Object {
void one();
}''');
        final reader = SourceReader();
        expect(
            () => reader.read(x.element),
            isNot(
              throwsA(anything),
            ));
      });

      test('no items', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      test('method with type params', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one<T>();
}''');
        final reader = SourceReader();
        expect(
          () => reader.read(x.element),
          throwsSealedErrorNotInternal(),
        );
      });

      group('WithType with bad type', () {
        test('space', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(@WithType("Hello ") x);
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });
      });

      group('Meta with bad name', () {
        test('top space', () async {
          final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix("Hel lo")
abstract class _Basic {
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('sub space', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName("Hel lo")
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('top nullability', () async {
          final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix("Hello?")
abstract class _Basic {
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('sub nullability', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName("Hello?")
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('top lower start', () async {
          final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix("hello")
abstract class _Basic {
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('sub lower start', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName("hello")
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('top private', () async {
          final x = await resolveSealedSafe('''
@Sealed()
@WithPrefix("_Hello")
abstract class _Basic {
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });

        test('sub private', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@WithName("_Hello")
void one();
}''');
          final reader = SourceReader();
          expect(
            () => reader.read(x.element),
            throwsSealedErrorNotInternal(),
          );
        });
      });
    });
  });
}
