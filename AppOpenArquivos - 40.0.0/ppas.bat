@echo off
SET THEFILE=D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\OpenArquivos.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s --subsystem windows --entry=_WinMainCRTStartup   --base-file base.$$$ -o "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\OpenArquivos.exe" "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\link7916.res"
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.2.2\bin\i386-win32\dlltool.exe -S C:\lazarus\fpc\3.2.2\bin\i386-win32\as.exe -D "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\OpenArquivos.exe" -e exp.$$$ --base-file base.$$$ 
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.2.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  -s --subsystem windows --entry=_WinMainCRTStartup  -o "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\OpenArquivos.exe" "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\link7916.res" exp.$$$
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.2.2\bin\i386-win32\postw32.exe --subsystem gui --input "D:\PacotesLazarus\Open-Arquivos-master\AppOpenArquivos - 40.0.0\OpenArquivos.exe" --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
