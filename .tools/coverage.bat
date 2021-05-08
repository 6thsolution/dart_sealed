@echo off

echo install coverage package
call dart pub global activate coverage

echo prepare combine file
mkdir coverage 2> NUL
del coverage\lcov.info 2> NUL

echo coverage sealed_annotations
pushd sealed_annotations || exit
call dart test test\all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo coverage sealed_generators
pushd sealed_generators || exit
call dart test test\all_test.dart --coverage dart_coverage
call dart pub global run coverage:format_coverage -i dart_coverage -o coverage/lcov.info --lcov --packages .packages --report-on lib
popd || exit

echo combining coverage
type sealed_annotations\coverage\lcov.info sealed_generators\coverage\lcov.info > coverage\lcov.info
