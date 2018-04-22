@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-v" If "%2"=="0.0.1" Goto Boot
If "%1"=="-v" If "%2"=="0.0.2" Goto Boot
If "%1"=="-v" If "%2"=="0.0.3" Goto Boot
rem ; If "%1"=="-v" If "%2"=="0.0.4" Goto Boot
If "%1"=="-a" If "%2"=="OK" Goto PUSHUSER
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:Boot
Cls
Title ShadowRain - System
If "%2"=="0.0.1" Goto 0.0.1
If "%2"=="0.0.2" Goto 0.0.2
If "%2"=="0.0.3" UacSys.bat -LGN 0.0.3
rem ; If "%2"=="0.0.4" UacSys.bat -LGN 0.0.4
Exit

:MAKE_USER
UacSys.bat -mkusr

:AUTHENTICATE
UacSys.bat -auth !User!

:PUSHUSER
If "!Version!"=="0.0.3" Goto 0.0.3
rem ; If "!Version!"=="0.0.4" Goto 0.0.4

:0.0.1
Title ShadowRain - System [Version : 0.0.1]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo -- Press any key to boot into ShadowRain - Version 0.0.1 (Build Date: 09/08/17) --
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Pause>Nul
Echo.
Echo.
CommandEngine.bat -v 0.0.1
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
Echo -- Press any key to boot into ShadowRain - Version 0.0.4 (Build Date: Unknown) --
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Pause>Nul
Echo.
Echo.
rem ; CommandEngine.bat -v 0.0.4
Exit
