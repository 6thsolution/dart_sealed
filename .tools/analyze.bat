@echo off

echo HEADER analyze

pushd sealed_annotations || exit 1
echo NOTE sealed_annotations
call dart analyze || exit 1
popd || exit 1

pushd sealed_writer || exit 1
echo NOTE sealed_writer
call dart analyze || exit 1
popd || exit 1

pushd sealed_generators || exit 1
echo NOTE sealed_generators
call dart analyze || exit 1
popd || exit 1

pushd example || exit 1
echo NOTE example
call dart analyze || exit 1
popd || exit 1
