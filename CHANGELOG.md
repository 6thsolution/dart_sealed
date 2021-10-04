## 1.11.0

- Added whenOrNull and mapOrNull methods (#12)
- Using fixed version dependencies
- Using lints package instead of pedantic for analysis

## 1.10.0

- Fixed @WithPrefix allowing empty string as argument (#6)
- Added capability of adding common fields (#8)
- Updated docs according to ignore/exclude generated files (#5)

## 1.9.0

- Changed not using `required` on nullable fields and arguments (#4)

## 1.8.0

- Changed using `any` for external dependencies

## 1.7.0

- Removed @immutable, @factory and @sealed generation
- Removed meta export from sealed_annotations
- Added support for functional types as field types (#3)

## 1.6.0

- Changed cast methods to getters (#1)
- Downgrade meta to 1.3.0

## 1.5.0

- Removed support for super_enum API
- Removed support for non null-safe projects
- Removed whenOrThrow, whenOrNull and whenOrDefault
- Removed wrapping functionality (#1)
- Rename whenOrElse to maybeWhen (#1)
- Rename whenPartial to partialWhen (#1)
- Refactor partialWhen implementation
- Added map, maybeMap and partialMap methods (#1)

## 1.4.0

- Fix version problems

## 1.3.0

- Using const factories (#1)
- Updated analyzer to 2.0.0

## 1.2.0

- Using factory instead of static methods
- Disabled copy method generation

## whenOrNull0

- Decoupled super_enum APIs from dart_sealed

## 1.0.0

- Initial version
