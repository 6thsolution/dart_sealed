@echo off

pushd sealed_annotations || exit
echo NOTE sealed_annotations
call dart test
popd || exit

pushd sealed_writer || exit
echo NOTE sealed_writer
call dart test
popd || exit

pushd sealed_generators || exit
echo NOTE sealed_generators
call dart test
popd || exit

pushd sealed_example || exit
echo NOTE sealed_example
call dart test
popd || exit

pushd super_enum_sealed_annotations || exit
echo NOTE super_enum_sealed_annotations
call dart test
popd || exit

pushd super_enum_sealed_generators || exit
echo NOTE super_enum_sealed_generators
call dart test
popd || exit

pushd super_enum_sealed_example || exit
echo NOTE super_enum_sealed_example
call dart test
popd || exit
