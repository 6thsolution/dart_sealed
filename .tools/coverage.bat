@echo off

echo NOTE install coverage package
call dart pub global activate coverage

echo NOTE prepare combine file
mkdir coverage 2> NUL
del coverage\lcov.info 2> NUL

echo NOTE sealed_annotations
pushd sealed_annotations || exit
call dart test test\all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo NOTE sealed_writer
pushd sealed_writer || exit
call dart test test/all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo NOTE sealed_generators
pushd sealed_generators || exit
call dart test test\all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo NOTE sealed_super_enum_annotations
pushd sealed_super_enum_annotations || exit
call dart test test/all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo NOTE sealed_super_enum_generators
pushd sealed_super_enum_generators || exit
call dart test test/all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo NOTE combining coverage
type^
 sealed_annotations\coverage\lcov.info^
 sealed_writer\coverage\lcov.info^
 sealed_generators\coverage\lcov.info^
 sealed_super_enum_annotations\coverage\lcov.info^
 sealed_super_enum_generators\coverage\lcov.info^
 > coverage\lcov.info
