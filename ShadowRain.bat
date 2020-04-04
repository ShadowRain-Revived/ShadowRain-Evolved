@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-Version" If "%2"=="0.0.2" Goto System_Boot
If "%1"=="-Version" If "%2"=="0.0.3" Goto System_Boot
If "%1"=="-Version" If "%2"=="0.0.4" Goto System_Boot
If "%1"=="-Authenticate" If "%2"=="0.0.3" Goto 0.0.3
If "%1"=="-Authenticate" If "%2"=="0.0.4" Goto 0.0.4
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:System_Boot
Cls
Title ShadowRain - System
If "%2"=="0.0.2" Goto 0.0.2
If "%2"=="0.0.3" UacSys.bat -LoginVersion 0.0.3
If "%2"=="0.0.4" UacSys.bat -LoginVersion 0.0.4
Exit

:0.0.2
Title ShadowRain - System [Version : 0.0.2]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo -- Press any key to boot into ShadowRain - Version 0.0.2 (Build Date: 17/08/17) --
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Pause>Nul
Echo.
Echo.
CommandEngine.bat -v 0.0.2
Exit

:0.0.3
Title ShadowRain - System [Version : 0.0.3] [Logged into system as : !User!]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo -- Press any key to boot into ShadowRain - Version 0.0.3 (Build Date: 14/01/18) --
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Pause>Nul
Echo.
Echo.
CommandEngine.bat -v 0.0.3
Exit

:0.0.4
Title ShadowRain - System [Version : 0.0.4] [Logged into system as : !User!]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo -- Press any key to boot into ShadowRain - Version 0.0.4 R2 (Build Date: 04/04/20) --
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Pause>Nul
Echo.
Echo.
CommandEngine.bat -v 0.0.4
Exit
