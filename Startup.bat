@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" cmd /k Startup.bat -s
If "%1"=="-s" Goto StartupVar
Exit

:: test
:StartupVar
Cls
Title ShadowRain - Boot Menu
Color 0D
Set Version=
Goto Startup

:Startup
Set /P Version="Version? [0.0.2, 0.0.3, 0.0.4]: "
If "!Version!"=="0.0.1" (
	Echo This Version is no longer supported, Booting into 0.0.2 instead.
	Set "Version=0.0.2"
	Goto Startup
)
If "!Version!"=="0.0.2" (
	If Not Exist ShadowRain.bat ErrHndlr.bat -E 00_10_00
	If Not Exist modules ErrHndlr.bat -E 00_10_10
	If Not Exist CommandEngine.bat ErrHndlr.bat -E 00_10_20
	If Not Exist modules\0.0.2.bat ErrHndlr.bat -E 00_40_20
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -v 0.0.2
)
If "!Version!"=="0.0.3" (
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHndlr.bat -E 00_10_00
	If Not Exist modules ErrHndlr.bat -E 00_10_10
	If Not Exist CommandEngine.bat ErrHndlr.bat -E 00_10_20
	If Not Exist modules\0.0.3.bat ErrHndlr.bat -E 00_40_30
	If Not Exist Encdec.bat ErrHndlr.bat -E 00_10_40
	If Not Exist UacSys.bat ErrHndlr.bat -E 00_10_30
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -v 0.0.3
)
If "!Version!"=="0.0.4" (
	If Not Exist ErrHndlr.bat Goto NoErrHndlr
	If Not Exist ShadowRain.bat ErrHandler.bat -E 00_10_00
	If Not Exist modules ErrHndlr.bat -E 00_10_10
	If Not Exist CommandEngine.bat ErrHndlr.bat -E 00_10_20
	If Not Exist modules\0.0.4.bat ErrHndlr.bat -E 00_40_40
	If Not Exist NetHndlr.bat ErrHndlr.bat -E 00_40_41
	If Not Exist Encdec.bat ErrHndlr.bat -E 00_10_40
	If Not Exist UacSys.bat ErrHndlr.bat -E 00_10_30
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -v 0.0.4
)
Echo.
If "!Version!"=="" ErrHndlr.bat -E 00_50_00
If Not "!Version!"=="0.0.1" ErrHndlr.bat -E 00_50_10
If Not "!Version!"=="0.0.2" ErrHndlr.bat -E 00_50_10
If Not "!Version!"=="0.0.3" ErrHndlr.bat -E 00_50_10
If Not "!Version!"=="0.0.4" ErrHndlr.bat -E 00_50_10
Exit

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
