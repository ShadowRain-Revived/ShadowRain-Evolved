@echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" cmd /k Startup.bat -s
If "%1"=="-s" goto Startup
Exit

:Startup
Title ShadowRain - Boot Menu
Color 0D
Set Version=
Set /P Version="Version? [0.0.1, 0.0.2]: "
If "%Version%"=="0.0.1" (
	If Not Exist ShadowRain.bat Goto NO_EXIST_SHADOWRAIN
	If Not Exist modules Goto NO_EXIST_MODULES
	If Not Exist CommandEngine.bat Goto NO_EXIST_COMMANDENGINE
	If Not Exist modules\0.0.1.bat Goto NO_EXIST_001
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -v 0.0.1
)
If "%Version%"=="0.0.2" (
	If Not Exist ShadowRain.bat Goto NO_EXIST_SHADOWRAIN
	If Not Exist modules Goto NO_EXIST_MODULES
	If Not Exist CommandEngine.bat Goto NO_EXIST_COMMANDENGINE
	If Not Exist modules\0.0.2.bat Goto NO_EXIST_002
	If Exist ShadowRain.bat If Exist CommandEngine.bat cmd /k ShadowRain.bat -v 0.0.2
)
Echo.
If "%Version%"=="" Goto NO_VALUE
If Not "%Version%"=="0.0.1" Goto INVALID_VALUE
If Not "%Version%"=="0.0.2" Goto INVALID_VALUE
Exit

rem ; Split function to fix bug - When error occurs in modules (NO_PARAM) - Will return to end statement avoiding version checks.
:INVALID_VALUE
If "%Version%"=="0.0.1" Goto Startup
If "%Version%"=="0.0.2" Goto Startup
Echo "%Version%" - This is not a valid version of ShadowRain.
Echo.
Echo Press any key to return to the ShadowRain boot menu.
Pause>Nul
Goto Startup

:NO_VALUE
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : Undefined Value - Startup.bat
Echo            - [%cd%\][Startup.bat]:@10:14
Echo            - NO_DEFINED_RESULT:@10
Echo           - :@10:VERSION_UNDEFINED
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.        
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_SHADOWRAIN
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - ShadowRain.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_COMMANDENGINE
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - CommandEngine.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_MODULES
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : Directory Missing - modules
Echo            - Please add the missing directory and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_ENCDEC
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - Encdec.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_UACSYS
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - UacSys.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_001
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - modules\0.0.1.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\modules
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:NO_EXIST_002
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - modules\0.0.2.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\modules
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit
