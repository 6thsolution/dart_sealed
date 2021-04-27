import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:sealed_generators/src/manifest/manifest.dart';
import 'package:sealed_generators/src/options/options.dart';
import 'package:sealed_generators/src/source/reader/source_reader.dart';
import 'package:sealed_generators/src/source/source.dart';
import 'package:test/test.dart';

import '../utils/exception_utils.dart';
import 'utils/read_utils.dart';

const optionsSafe = Options(isNullSafe: true);
const optionsLegacy = Options(isNullSafe: false);

void main() {
  group('source reader', () {
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
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'BasicTwo',
                      shortName: 'two',
                      equality: Equality.data,
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

          test('equality', () async {
            final x = await resolveSealedSafe('''
@Sealed(equality: Equality.identity)
abstract class _Basic {
void one();
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.identity,
                      fields: [],
                    ),
                  ],
                ),
              ),
            );
          });

          group('meta', () {
            test('change name', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: 'Hello')
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsSafe,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'Hello',
                        shortName: 'one',
                        equality: Equality.data,
                        fields: [],
                      ),
                    ],
                  ),
                ),
              );
            });

            test('change equality', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(equality: Equality.identity)
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsSafe,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'BasicOne',
                        shortName: 'one',
                        equality: Equality.identity,
                        fields: [],
                      ),
                    ],
                  ),
                ),
              );
            });

            test('change both', () async {
              final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: 'Hello', equality: Equality.identity)
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsSafe,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'Hello',
                        shortName: 'one',
                        equality: Equality.identity,
                        fields: [],
                      ),
                    ],
                  ),
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
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.data,
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
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
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
                      equality: Equality.data,
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
                      equality: Equality.data,
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
                      equality: Equality.data,
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
              ),
            );
          });

          test('default bound', () async {
            final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic<T> {
void one();
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsSafe,
                manifest: Manifest(
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
                      equality: Equality.data,
                      fields: [],
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
            final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic {
void one();
void two(int x, double y);
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.data,
                      fields: [],
                    ),
                    ManifestItem(
                      name: 'BasicTwo',
                      shortName: 'two',
                      equality: Equality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'int',
                            isNullable: true,
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

          test('equality', () async {
            final x = await resolveSealedLegacy('''
@Sealed(equality: Equality.identity)
abstract class _Basic {
void one();
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.identity,
                      fields: [],
                    ),
                  ],
                ),
              ),
            );
          });

          group('meta', () {
            test('change name', () async {
              final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic {
@Meta(name: 'Hello')
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsLegacy,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'Hello',
                        shortName: 'one',
                        equality: Equality.data,
                        fields: [],
                      ),
                    ],
                  ),
                ),
              );
            });

            test('change equality', () async {
              final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic {
@Meta(equality: Equality.identity)
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsLegacy,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'BasicOne',
                        shortName: 'one',
                        equality: Equality.identity,
                        fields: [],
                      ),
                    ],
                  ),
                ),
              );
            });

            test('change both', () async {
              final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic {
@Meta(name: 'Hello', equality: Equality.identity)
void one();
}''');
              final reader = const SourceReader();
              final source = reader.read(x.element, x.annotation);
              expect(
                source,
                Source(
                  options: optionsLegacy,
                  manifest: Manifest(
                    name: 'Basic',
                    params: [],
                    items: [
                      ManifestItem(
                        name: 'Hello',
                        shortName: 'one',
                        equality: Equality.identity,
                        fields: [],
                      ),
                    ],
                  ),
                ),
              );
            });
          });

          test('withType', () async {
            final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic {
void one(@WithType('double?') x, @WithType('double') int y);
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [],
                  items: [
                    ManifestItem(
                      name: 'BasicOne',
                      shortName: 'one',
                      equality: Equality.data,
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

        group('generic', () {
          test('basic', () async {
            final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic<T extends num, E extends Object> {
void one(T x);
void two(E y);
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
                  name: 'Basic',
                  params: [
                    ManifestParam(
                      name: 'T',
                      bound: ManifestType(
                        name: 'num',
                        isNullable: true,
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
                      equality: Equality.data,
                      fields: [
                        ManifestField(
                          name: 'x',
                          type: ManifestType(
                            name: 'T',
                            isNullable: true,
                          ),
                        ),
                      ],
                    ),
                    ManifestItem(
                      name: 'BasicTwo',
                      shortName: 'two',
                      equality: Equality.data,
                      fields: [
                        ManifestField(
                          name: 'y',
                          type: ManifestType(
                            name: 'E',
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

          test('default bound', () async {
            final x = await resolveSealedLegacy('''
@Sealed()
abstract class _Basic<T> {
void one();
}''');
            final reader = const SourceReader();
            final source = reader.read(x.element, x.annotation);
            expect(
              source,
              Source(
                options: optionsLegacy,
                manifest: Manifest(
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
                      equality: Equality.data,
                      fields: [],
                    ),
                  ],
                ),
              ),
            );
          });
        });
      });
    });

    group('should fail if', () {
      test('upper method name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void One();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('lower class name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _basic {
void one();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('upper field name', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(int X);
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('non class element of enum', () async {
        final x = await resolveSealedSafe('''
@Sealed()
enum _Basic {
a, b, c,
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('non class element of method', () async {
        final x = await resolveSealedSafe('''
@Sealed()
void hello() {}
''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('public element', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class Basic {
void one();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('private method', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void _one();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('private method argument', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(int _x);
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
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
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
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
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('with super type of Object', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic extends Object {
void one();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          isNot(throwsA(anything)),
        );
      });

      test('no items', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      test('method with type params', () async {
        final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one<T>();
}''');
        final reader = const SourceReader();
        expect(
          () => reader.read(x.element, x.annotation),
          throwsSealedErrorNotInternal(),
        );
      });

      group('WithType with bad type', () {
        test('space', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(@WithType("Hel llo") x);
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });

        test('with nullability comments', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
void one(@WithType("double/*?*/") x);
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });
      });

      group('Meta with bad name', () {
        test('space', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: "Hel lo")
void one();
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });

        test('nullability', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: "Hello?")
void one();
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });

        test('lower start', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: "hello")
void one();
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });

        test('private', () async {
          final x = await resolveSealedSafe('''
@Sealed()
abstract class _Basic {
@Meta(name: "_Hello")
void one();
}''');
          final reader = const SourceReader();
          expect(
            () => reader.read(x.element, x.annotation),
            throwsSealedErrorNotInternal(),
          );
        });
      });
    });
  });
}
