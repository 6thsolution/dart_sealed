@echo off

echo HEADER format

pushd sealed_annotations || exit 1
echo NOTE sealed_annotations
call dart format --fix lib test
popd || exit 1

pushd sealed_writer || exit 1
echo NOTE sealed_writer
call dart format --fix lib test
popd || exit 1

pushd sealed_generators || exit 1
echo NOTE sealed_generators
call dart format --fix lib test
popd || exit 1

pushd sealed_example || exit 1
echo NOTE sealed_example
call dart format --fix test
popd || exit 1

pushd super_enum_sealed_annotations || exit 1
echo NOTE super_enum_sealed_annotations
call dart format --fix lib test
popd || exit 1

pushd super_enum_sealed_generators || exit 1
echo NOTE super_enum_sealed_generators
call dart format --fix lib test
popd || exit 1

pushd super_enum_sealed_example || exit 1
echo NOTE super_enum_sealed_example
call dart format --fix test
popd || exit 1
