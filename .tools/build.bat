@echo off

echo HEADER build

pushd example || exit 1
echo NOTE example
call dart run build_runner build --delete-conflicting-outputs || exit 1
popd || exit 1
