@echo off

call .tools\cpls || exit 1
call .tools\cpch || exit 1
call .tools\cprm || exit 1
call .tools\init || exit 1
call .tools\fix || exit 1
call .tools\format || exit 1
call .tools\analyze || exit 1
call .tools\build || exit 1
call .tools\cpex || exit 1
call .tools\test || exit 1
call .tools\coverage || exit 1
call .tools\example || exit 1

git add .
git status
