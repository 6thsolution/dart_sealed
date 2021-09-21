@echo off

echo HEADER example

pushd sealed_annotations || exit 1
echo NOTE sealed_annotations
call dart run example/example.dart || exit 1
popd || exit 1

pushd sealed_writer || exit 1
echo NOTE sealed_writer
call dart run example/example.dart || exit 1
popd || exit 1

pushd sealed_generators || exit 1
echo NOTE sealed_generators
call dart run example/example.dart || exit 1
popd || exit 1

pushd example || exit 1
echo NOTE example
call dart run bin/example.dart || exit 1
popd || exit 1
