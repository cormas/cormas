/*************************************************************************
 *
 *  NSIS Setup script
 *
 * (c) 2017 by Cirad, All rights reserved
 *
 * Requires: NSIS 2.42 http://nsis.sourceforge.net
 *           ZIP DLL   http://nsis.sourceforge.net/ZipDLL
 *************************************************************************/

SetCompressor /SOLID lzma            ;use LZMA algorithm

###################################
# Includes
###################################
!include "MUI.nsh"
!include "ZipDLL.nsh"


###################################
# Definitions
###################################
; General definitions
!define /date TIMESTAMP "%Y-%m-%d-%H-%M-%S"
!define PROVIDER "Cirad"
!define PRODUCT  "CORMAS"
!define PRODUCT_LOWERCASE "cormas"
!define URL      "http://cormas.cirad.fr/"
!define YEAR     "2017"
!define LAUNCHER "CORMAS_Installer.exe"
!define LICENSE_EN "LICENSE_ENGLISH.txt"
!define ESTIMATED_SIZE_MB "90"
# !define VERSION "0.24"

# This is the size (in kB) of all the files copied into "Program Files"
# !define INSTALLSIZE 184000

!define APP_NAME "${PRODUCT}"
!define REG_KEY  "SOFTWARE\${APP_NAME}"
!define MGROUP   "${PRODUCT}"
!define UNINSTALLER_NAME "Uninstall-${PRODUCT}"
!define REG_UNINSTALL "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}"

; SOURCE Definitions
!define SETUP_NAME "setup_${PRODUCT_LOWERCASE}_${VERSION}.exe"
!define OUTPUT_TARGET "${SETUP_NAME}" 

; TARGET Definitions
!define TARGET_DIR "$LOCALAPPDATA\${PRODUCT}"
; User with admin rights
; !define TARGET_DIR "$PROGRAMFILES\${PRODUCT}"

###################################
# Start Menu section
###################################
!define START_LINK_DIR "$STARTMENU\Programs\${PRODUCT}"
!define START_LINK_RUN "$STARTMENU\Programs\${PRODUCT}\${PRODUCT}.lnk"
!define START_LINK_UNINSTALLER "$STARTMENU\Programs\${PRODUCT}\Uninstall ${PRODUCT}.lnk"

# Start Menu
# createDirectory "$SMPROGRAMS\${COMPANYNAME}"
# createShortCut "$SMPROGRAMS\${COMPANYNAME}\${APPNAME}.lnk" "$INSTDIR\app.exe" "" "$INSTDIR\logo.ico"

###################################
# Compiler commands
###################################
Name        "${PRODUCT}"
Caption		"${PRODUCT}"
OutFile      "${OUTPUT_TARGET}"
InstallDir   "${TARGET_DIR}"                             ;Default installation 
InstallDirRegKey HKCU "${REG_KEY}" ""                    ;Get installation from registry if available
RequestExecutionLevel user                               ;Administrator execution level access is not needed
BrandingText "${APP_NAME} Version ${VERSION}"            ;brand the installer so now NSIS stuff is shown
XPStyle      on
CRCCheck     on                                          ;do a CRC check
SetOverwrite on                                          ;force overwrite
SetCompress force                                        ;force compression

###################################
# Infos for Software control panel
###################################

VIProductVersion "${VERSION}"
VIAddVersionKey ProductName     "${APP_NAME}"
VIAddVersionKey ProductVersion  "${VERSION}"
VIAddVersionKey CompanyName     "${PROVIDER}"
VIAddVersionKey CompanyWebsite  "${URL}"
VIAddVersionKey FileVersion     ""
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright  "(c) ${YEAR} by ${PROVIDER}"

###################################
# Modern User Interface settings
###################################
; Other Definitions
!define MUI_ICON   "CormasLogoBig.ico"                              ; icon for the installer

!define MUI_HEADERIMAGE
# !define MUI_HEADERIMAGE_BITMAP "header.bmp"                 ; optional
!define MUI_WELCOMEFINISHPAGE_BITMAP "CormasLogoFull.bmp"     ; optional
!define MUI_FINISHPAGE_NOAUTOCLOSE                          ; Do not automatically jump to the finish page, to allow the user to check the install log.
!define MUI_UNFINISHPAGE_NOAUTOCLOSE                        ; Do not automatically jump to the finish page, to allow the user to check the uninstall log.
!define MUI_FINISHPAGE_RUN "$INSTDIR\${LAUNCHER}"           ; allows to run the application after install

###################################
# Pages
###################################

;Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${LICENSE_EN}"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

###################################
# Language
###################################
!insertmacro MUI_LANGUAGE "English"
LicenseLangString MUILicense ${LANG_ENGLISH} "${LICENSE_EN}"

###################################
# Installer section
###################################
Section "Pharo VM" Section1
  SetOutPath "$INSTDIR"
  SetOverwrite on
  DetailPrint "Installation Started."

	File "pharo-vm\zlib1.dll"	
	File "pharo-vm\CORMAS.exe"
	File "pharo-vm\SurfacePlugin.dll"
	File "pharo-vm\ssleay32.dll"	
	File "pharo-vm\SqueakSSL.dll"
	File "pharo-vm\SDL2.dll"
	File "pharo-vm\libssh2-1.dll"	
	File "pharo-vm\libpng16-16.dll"
	File "pharo-vm\libpixman-1-0.dll"
	File "pharo-vm\libgit2.dll"
	File "pharo-vm\libfreetype.dll"
	File "pharo-vm\libeay32.dll"
	File "pharo-vm\libcairo-2.dll"
	File "pharo-vm\FT2Plugin.dll"
	File "pharo-vm\iconv.dll"
	File "pharo-vm\libgcc_s_sjlj-1.dll"
	File "pharo-vm\libwinpthread-1.dll"
	File README.txt 

	;File "ProcessWrapperPlugin.dll"
	;File "pharo-vm\Win32OSProcessPlugin.dll"    
	;File /r InstallationDir1
	;File /r InstallationDir2

  ;Store installation 
  WriteRegStr HKCU "${REG_KEY}" "" $INSTDIR
  
  WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayName" "${PRODUCT}"
  WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayIcon" "$\"$INSTDIR\${PRODUCT}.exe$\""
  WriteRegStr HKCU "${REG_UNINSTALL}" "Publisher" "${PROVIDER}"
  WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayVersion" "${VERSION}"
  WriteRegDWord HKCU "${REG_UNINSTALL}" "EstimatedSize" "${ESTIMATED_SIZE_MB}" ;MB
  WriteRegStr HKCU "${REG_UNINSTALL}" "HelpLink" "${URL}"
  WriteRegStr HKCU "${REG_UNINSTALL}" "URLInfoAbout" "${URL}"
  WriteRegStr HKCU "${REG_UNINSTALL}" "InstallLocation" "$\"$INSTDIR$\""
  WriteRegStr HKCU "${REG_UNINSTALL}" "InstallSource" "$\"$EXEDIR$\""
  WriteRegDWord HKCU "${REG_UNINSTALL}" "NoModify" 1
  WriteRegDWord HKCU "${REG_UNINSTALL}" "NoRepair" 1
  WriteRegStr HKCU "${REG_UNINSTALL}" "UninstallString" "$\"$INSTDIR\${UNINSTALLER_NAME}$\""
  WriteRegStr HKCU "${REG_UNINSTALL}" "Comments" "Uninstalls ${PRODUCT}."

;Create uninstaller
  WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"
  
  SetOutPath $INSTDIR
  DetailPrint "Create Program group"
;  CreateDirectory "$SMPROGRAMS\${MGROUP}"
;  CreateShortCut "$SMPROGRAMS\${MGROUP}\${PRODUCT}.lnk" "$INSTDIR\${LAUNCHER}"
;  CreateShortCut "$SMPROGRAMS\${MGROUP}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
 
  SetShellVarContext current
  CreateDirectory "${START_LINK_DIR}"
  CreateShortCut "${START_LINK_RUN}" "$INSTDIR\${PRODUCT}.exe"
  CreateShortCut "${START_LINK_UNINSTALLER}" "$INSTDIR\${UNINSTALLER_NAME}.exe"

  
SectionEnd

Section "Image and Sources" Section2
  SetOutPath "$INSTDIR"

  File CORMAS-${VERSION}.changes
  File CORMAS-${VERSION}.image
  File "pharo-vm\PharoV60.sources"  
  
SectionEnd

###################################
# Section description
###################################
LangString DESC_Section1 ${LANG_ENGLISH} "The pharo virtual machine and components"
LangString DESC_Section2 ${LANG_ENGLISH} "The pharo image and sources"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

###################################
# Uninstaller section
###################################
Section "Uninstall"
SetOutPath $INSTDIR
    DetailPrint "Start uninstalling"
    
    Delete "$INSTDIR\README.txt"
    Delete "$INSTDIR\LICENSE_ENGLISH"
    Delete "$INSTDIR\CORMAS.exe"
    Delete "$INSTDIR\CORMAS-${VERSION}.changes"
    Delete "$INSTDIR\CORMAS-${VERSION}.image"
	 Delete "$INSTDIR\"
    Delete "$INSTDIR\"
    Delete "$INSTDIR\SqueakFFIPrims.dll"
    Delete "$INSTDIR\FT2Plugin.dll"
    Delete "$INSTDIR\libfreetype-6.dll"
    Delete "$INSTDIR\libgit2.dll"
    Delete "$INSTDIR\libssh2-1.dll"
	 Delete "$INSTDIR\ssleay32.dll"
	 Delete "$INSTDIR\zlib1.dll"	
    Delete "$INSTDIR\SqueakSSL.dll"
    Delete "$INSTDIR\libcairo-2.dll"
    Delete "$INSTDIR\libeay32.dll"	
    Delete "$INSTDIR\libpixman-1-0.dll"
    Delete "$INSTDIR\libpng-3.dll"
    ;Delete "ProcessWrapperPlugin.dll"
    ;Delete "$INSTDIR\Win32OSProcessPlugin.dll"

    ;RmDir /r "$INSTDIR\InstallationDir1"
    ;RmDir /r "$INSTDIR\InstallationDir2"

;delete uninstaller
    Delete "$INSTDIR\Uninstall.exe"
    RmDir /r /REBOOTOK "$SMPROGRAMS\${MGROUP}"
    RmDir /REBOOTOK $INSTDIR
    DeleteRegKey /ifempty HKCU "${REG_KEY}"
SectionEnd

#################################
# Utilities
#################################

# Installer functions
Function .onInit
	; Check to see if already installed
	ReadRegStr $R0 HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "UninstallString"
	; MessageBox MB_OK "CORMAS is installed at $R0"	
	StrCmp $R0 "" done
	MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION "${PRODUCT} is already installed. $\n$\nClick `OK` to remove the \
	previous version or `Cancel` to cancel this upgrade." IDOK uninst
	Abort

uninst:	
	ClearErrors
   ; Pop $R1
	; StrCmp $R1 2 Quit +1
	ExecWait '$R0 _?=$INSTDIR' ;Do not copy the uninstaller to a temp file	
	;Exec $R0

done:
    InitPluginsDir
    Push $R1
    File /oname=$PLUGINSDIR\spltmp.jpg ${MUI_WELCOMEFINISHPAGE_BITMAP}
    advsplash::show 3000 600 400 -1 $PLUGINSDIR\spltmp
    Pop $R1
    Pop $R1
	
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "CORMASMutex") i .r1 ?e'
	Pop $R0
 
	StrCmp $R0 0 +3
	MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
	Abort
	
FunctionEnd
