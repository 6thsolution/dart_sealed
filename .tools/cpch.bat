@echo off

echo COPY CHANGELOG FILE

copy CHANGELOG.md sealed_annotations\
copy CHANGELOG.md example\
copy CHANGELOG.md sealed_generators\
copy CHANGELOG.md sealed_writer\

echo DONE
