* mock Element classes for example1 and example2 and add tests for reading phase checking manifest and options.
* add build tests
* for efficiency cache some method and getter outputs in `BaseUtilsWriter`. for example by using a backing private field
  and lazy setting. Or a Map for method and getters depending on `ManifestItem`.
* change cast methods to getters ?
