@echo off
set LIB=%LIB%;"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x86";
"c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\Hostx86\x86\ml.exe" /c /coff %1.s
"c:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\Hostx86\x86\link.exe" /subsystem:windows /dll /def:%1.def /noentry %1.obj
echo.
