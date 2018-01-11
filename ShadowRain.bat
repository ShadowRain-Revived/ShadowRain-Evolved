@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-v" If "%2"=="0.0.1" Goto Boot
If "%1"=="-v" If "%2"=="0.0.2" Goto Boot
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
Exit

:0.0.1
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
