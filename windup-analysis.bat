@echo off
echo Starting recursive Windup execution...

set JAVA_HOME="C:\Program Files (x86)\Java\jre1.8.0_73"
set WINDUP_HOME="C:\rhamt-cli-4.0.0"
set APP_BIN_ARTIFACTS="C:\temp\apps"
set WINDUP_TGT_OPTS=eap7
set JAVA_PKG_LIST=br la gov resources

for /r %APP_BIN_ARTIFACTS% %%x in (*.war *.ear) do (

	set "app_file_name=%%~x"

	echo.
	echo running WINDUP on "%%x"...
	call "%WINDUP_HOME%\bin\rhamt-cli.bat" -b --overwrite --enableTattletale --exportCSV --target %WINDUP_TGT_OPTS% --input %%x --output  "%%x.out" --packages %JAVA_PKG_LIST%
	
	echo  "%%x" report done!
	echo.

)

exit /B
