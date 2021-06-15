@echo off

echo COPY CHANGELOG FILE

copy CHANGELOG.md sealed_annotations\
copy CHANGELOG.md sealed_example\
copy CHANGELOG.md sealed_generators\
copy CHANGELOG.md sealed_writer\
copy CHANGELOG.md super_enum_sealed_annotations\
copy CHANGELOG.md super_enum_sealed_example\
copy CHANGELOG.md super_enum_sealed_generators\

echo DONE
