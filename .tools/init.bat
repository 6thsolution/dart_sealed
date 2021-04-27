@echo off

pushd sealed_annotations || exit
echo init sealed_annotations
call dart pub get
popd || exit
pushd sealed_generators || exit
echo init sealed_generators
call dart pub get
popd || exit
pushd example || exit
echo init example
call dart pub get
popd || exit
pushd sealed_super_enum_mapper || exit
echo init sealed_super_enum_mapper
call dart pub get
popd || exit
pushd sealed_super_enum_mapper_example || exit
echo init sealed_super_enum_mapper_example
call dart pub get
popd || exit
