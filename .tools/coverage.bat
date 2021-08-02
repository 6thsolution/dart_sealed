@echo off

echo HEADER coverage

echo NOTE install coverage package
call dart pub global activate coverage

echo NOTE prepare combine file
mkdir coverage 2> NUL
del coverage\lcov.info 2> NUL

echo NOTE sealed_annotations
pushd sealed_annotations || exit 1
call dart test --coverage dart_coverage || exit 1
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib || exit 1
popd || exit 1

echo NOTE sealed_writer
pushd sealed_writer || exit 1
call dart test --coverage dart_coverage || exit 1
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib || exit 1
popd || exit 1

echo NOTE sealed_generators
pushd sealed_generators || exit 1
call dart test --coverage dart_coverage || exit 1
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib || exit 1
popd || exit 1

echo NOTE combining coverage
type^
 sealed_annotations\coverage\lcov.info^
 sealed_writer\coverage\lcov.info^
 sealed_generators\coverage\lcov.info^
 > coverage\lcov.info

echo NOTE fixing coverage
call dart run .tools/fixcov.dart
