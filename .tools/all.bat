@echo off

call .tools\init
call .tools\format
call .tools\analyze
call .tools\build
call .tools\test
call .tools\coverage
call .tools\example
