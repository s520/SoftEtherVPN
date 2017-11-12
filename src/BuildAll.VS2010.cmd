SETLOCAL
SET BATCH_FILE_NAME=%0
SET BATCH_DIR_NAME=%0\..
SET NOW_TMP=%time:~0,2%
SET NOW=%date:~0,4%%date:~5,2%%date:~8,2%_%NOW_TMP: =0%%time:~3,2%%time:~6,2%
set VisualStudioVersion=10.0

call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
call "C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
echo on

del %BATCH_DIR_NAME%\bin\BuildUtil.exe

C:\windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe /toolsversion:4.0 /verbosity:detailed /target:Clean /property:Configuration=Debug "%BATCH_DIR_NAME%\BuildUtil\BuildUtil.VS201x.csproj"

C:\windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe /toolsversion:4.0 /verbosity:detailed /target:Rebuild /property:Configuration=Debug "%BATCH_DIR_NAME%\BuildUtil\BuildUtil.VS201x.csproj"

cmd /k "%BATCH_DIR_NAME%\bin\BuildUtil.exe /CMD:All"


