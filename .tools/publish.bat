@echo off

echo HEADER publish

pushd sealed_annotations || exit 1
echo NOTE sealed_annotations
call dart pub publish || exit 1
popd || exit 1

pushd sealed_writer || exit 1
echo NOTE sealed_writer
call dart pub publish || exit 1
popd || exit 1

pushd sealed_generators || exit 1
echo NOTE sealed_generators
call dart pub publish || exit 1
popd || exit 1
