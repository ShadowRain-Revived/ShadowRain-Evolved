@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" cmd /k %0 -Start
If "%1"=="-Start" Goto System_Startup
Exit

:System_Startup
Cls
Title ShadowRain - Boot Menu
Color 0D
Set Version=
:: Prevent an occurance where "echo" is an executable file on the PATH
If Exist Echo.* ( 
	Del Echo.* /S /Q >Nul
)
:: Say "Please Wait..." due to :SetupContainer taking more than 3 seconds.
Echo Please Wait...
Goto System_GetProcessID

:System_GetProcessID
For /F "tokens=2" %%a In ('tasklist /v ^| findstr /c:"ShadowRain - Boot Menu"') Do Set SystemProcessID=%%a
Cls
Goto System_GetVersion

:System_GetVersion
Set /P Version="Version? [0.0.2, 0.0.3, 0.0.4]: "
If "!Version!"=="0.0.1" (
	Echo This Version is no longer supported, Booting into 0.0.2 instead.
	Set "Version=0.0.2"
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHndlr.bat -Error MF00_SR00_0200
	If Not Exist modules ErrHndlr.bat -Error MD00_ML00_0000
	If Not Exist CommandEngine.bat ErrHndlr.bat -Error MF00_CE00_0200
	If Not Exist modules\0.0.2.bat ErrHndlr.bat -Error MFD0_ML00_0200
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -Version 0.0.2
)
If "!Version!"=="0.0.2" (
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHndlr.bat -Error MF00_SR00_0200
	If Not Exist modules ErrHndlr.bat -Error MD00_MDLS_0000
	If Not Exist CommandEngine.bat ErrHndlr.bat -Error MF00_CE00_0200
	If Not Exist modules\0.0.2.bat ErrHndlr.bat -Error MFD0_MDLS_0200
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -Version 0.0.2
)
If "!Version!"=="0.0.3" (
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHndlr.bat -Error MF00_SR00_0300
	If Not Exist modules ErrHndlr.bat -Error MD00_MDLS_0000
	If Not Exist CommandEngine.bat ErrHndlr.bat -Error MF00_CE00_0300
	If Not Exist modules\0.0.3.bat ErrHndlr.bat -Error MFD0_MDLS_0300
	If Not Exist Encdec.bat ErrHndlr.bat -Error MF00_ED00_0300
	If Not Exist UacSys.bat ErrHndlr.bat -Error MF00_US00_0300
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -Version 0.0.3
)
If "!Version!"=="0.0.4" (
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHandler.bat -Error MF00_SR00_0400
	If Not Exist modules ErrHndlr.bat -Error MD00_MDLS_0000
	If Not Exist CommandEngine.bat ErrHndlr.bat -Error MF00_CE00_0400
	If Not Exist modules\0.0.4.bat ErrHndlr.bat -Error MFD0_MDLS_0400
	If Not Exist NetHndlr.bat ErrHndlr.bat -Error MF00_NH00_0400
	If Not Exist Encdec.bat ErrHndlr.bat -Error MF00_ED00_0400
	If Not Exist UacSys.bat ErrHndlr.bat -Error MF00_US00_0400
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -Version 0.0.4
)
Goto System_GetVersion

:NoErrHndlr
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - ErrHndlr.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - "%cd%"\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit
