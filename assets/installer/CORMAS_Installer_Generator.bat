@echo OFF

:: Prerequisites :
:: 		wget for Windows
:: 		NSIS Unicode + ZipDLL.nsh (UTF-8)
:: 		7-Zip
:: 		An NSIS .nsi installer script (that you wrote or generated)
:: 		Image and subdirectories already present and matched with the .nsi script
:: 		Place this file in the same directory of .nsi file
:: Usage: 
:: 		CORMAS_Installer_Generator.bat <version>

:: EXEVERSION must be in x.x.x.x format for NSIS to be happy
set EXEVERSION=%1
set IMAGENAME=CORMAS-%EXEVERSION%.image
set CHANGESNAME=CORMAS-%EXEVERSION%.changes
set MYEXECNAME=CORMAS.exe
set NSINAME=CORMAS.nsi
:: set INSTALLER_RESOURCE_FILES=CORMAS_Installer_Resources.zip
:: set INSTALLER_RESOURCE_URL=https://github.com/hernanmd/cormas/blob/dev/CORMAS_Installer_Generator.bat
:: /%INSTALLER_RESOURCE_FILES%

:: Check missing version parameter
echo %1
if [%1]==[] goto NOVERSION

:: Optional: Rename executable and image/changes file names.
if not exist pharo-vm\%MYEXECNAME% (
 pushd pharo-vm
 ren Pharo.exe %MYEXECNAME%
 popd
)
if not exist %IMAGENAME% (
 ren Pharo.changes %CHANGESNAME%
 ren Pharo.image %IMAGENAME%
)

:: Try to get an unique directory name from date and time independent of locale, i.e. without usual separators (/,-,etc).
:: Currently this ONLY WORKS WITH LOCALE SETTING such as time /T gives hh:mm (for example, Spain)
For /f "tokens=1,2,3,4,5 delims=/. " %%a in ('date /T') do set CDate=%%a%%b%%c%%d
For /f "tokens=1,2 delims=: " %%f in ('time /T') do set CTime=%%f%%g
set TIMESTAMP=%CDate%%CTime%
echo Current Timestamp: %TIMESTAMP%"
:: Create a new directory in Current Directory
set NEWDIR="%CD%\%TIMESTAMP%"
md %NEWDIR%
set SCRIPTNAME="%CD%\%NSINAME%"

:: Set output log file
set OUT="%NEWDIR%\test.nsi.output"

:: Download installer resources in current directory, wait to complete to continue
:CheckOS
	if exist "%PROGRAMFILES(X86)%" (GOTO 64BIT) else (GOTO 32BIT)

:64BIT
	echo 64-bit...
	:: START /wait cmd.exe /c "pushd %programfiles(x86)%\GnuWin32\bin & wget" --directory-prefix=%CD% --no-check-certificate %INSTALLER_RESOURCE_URL%
	:: START /wait cmd.exe /c "pushd %programfiles(x86)%\GnuWin32\bin & wget" --directory-prefix=%CD% 
	:: popd
	:: Uncompress resource files
	:: START /wait cmd.exe /c "pushd %programfiles(x86)%\7-Zip & 7z" -y e %CD%\%INSTALLER_RESOURCE_FILES% -o%CD%
	:: START /wait cmd.exe /c "pushd %programfiles(x86)%\7-Zip & 7z" -o%CD%
	:: popd
	:: Call the MakeNSIS command
	START cmd.exe /c  "cd %programfiles(x86)%\NSIS\Unicode & makensis /DVersion="%EXEVERSION%" /V4 %SCRIPTNAME% > %OUT%"
	goto CLEAN

:32BIT
	echo 32-bit...
	:: START /wait cmd.exe /c "pushd %programfiles%\GnuWin32\bin & wget" --directory-prefix=%CD% --no-check-certificate %INSTALLER_RESOURCE_URL%
	:: START /wait cmd.exe /c "pushd %programfiles%\GnuWin32\bin & wget" --directory-prefix=%CD%
	:: popd
	:: Uncompress resource files
	:: START /wait cmd.exe /c "pushd %programfiles%\7-Zip & 7z" -y e %CD%\%INSTALLER_RESOURCE_FILES% -o%CD%
	:: START /wait cmd.exe /c "pushd %programfiles%\7-Zip & 7z" -o%CD%
	:: popd
	:: Call the MakeNSIS command
	START cmd.exe /c "cd %programfiles%\NSIS\Unicode & makensis /DVersion="%EXEVERSION%" /V4 %SCRIPTNAME% > %OUT%"
	GOTO CLEAN

:NOVERSION
	echo Missing version parameter
	goto FINISH
	
:CLEAN
	:: ren %IMAGENAME% Pharo.image
	:: ren %CHANGESNAME% Pharo.changes
	:: del %CD%\%INSTALLER_RESOURCE_FILES%

:FINISH
	echo Finished