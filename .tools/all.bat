@echo off

call .tools\init || exit 1
call .tools\format || exit 1
call .tools\analyze || exit 1
call .tools\build || exit 1
call .tools\test || exit 1
call .tools\coverage || exit 1
call .tools\example || exit 1
