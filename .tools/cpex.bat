@echo off

echo COPY EXAMPLE FILES

copy sealed_example\bin\sealed\nullsafe\data\simple\weather.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\weather.sealed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result.sealed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\mixed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\mixed.sealed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\wrap.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\wrap.sealed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\meta.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\meta.sealed.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result_complex.dart sealed_annotations\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result_complex.sealed.dart sealed_annotations\example\

copy sealed_example\bin\sealed\nullsafe\data\simple\weather.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\weather.sealed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result.sealed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\mixed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\mixed.sealed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\wrap.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\wrap.sealed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\meta.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\simple\meta.sealed.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result_complex.dart sealed_generators\example\
copy sealed_example\bin\sealed\nullsafe\data\generic\result_complex.sealed.dart sealed_generators\example\

copy super_enum_sealed_example\bin\nullsafe\weather.dart super_enum_sealed_annotations\example\
copy super_enum_sealed_example\bin\nullsafe\weather.super.dart super_enum_sealed_annotations\example\
copy super_enum_sealed_example\bin\nullsafe\result.dart super_enum_sealed_annotations\example\
copy super_enum_sealed_example\bin\nullsafe\result.super.dart super_enum_sealed_annotations\example\
copy super_enum_sealed_example\bin\nullsafe\use_class.dart super_enum_sealed_annotations\example\
copy super_enum_sealed_example\bin\nullsafe\use_class.super.dart super_enum_sealed_annotations\example\

copy super_enum_sealed_example\bin\nullsafe\weather.dart super_enum_sealed_generators\example\
copy super_enum_sealed_example\bin\nullsafe\weather.super.dart super_enum_sealed_generators\example\
copy super_enum_sealed_example\bin\nullsafe\result.dart super_enum_sealed_generators\example\
copy super_enum_sealed_example\bin\nullsafe\result.super.dart super_enum_sealed_generators\example\
copy super_enum_sealed_example\bin\nullsafe\use_class.dart super_enum_sealed_generators\example\
copy super_enum_sealed_example\bin\nullsafe\use_class.super.dart super_enum_sealed_generators\example\

echo DONE
