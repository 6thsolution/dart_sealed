@echo off

echo HEADER build

pushd sealed_example || exit 1
echo NOTE sealed_example
call dart run build_runner build --delete-conflicting-outputs || exit 1
popd || exit 1
