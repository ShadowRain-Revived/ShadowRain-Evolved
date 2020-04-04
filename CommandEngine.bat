@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-v" If "%2"=="0.0.2" Goto 0.0.2
If "%1"=="-v" If "%2"=="0.0.3" Goto 0.0.3
If "%1"=="-v" If "%2"=="0.0.4" Goto 0.0.4
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:0.0.2
modules\0.0.2.bat -z2

:0.0.3
modules\0.0.3.bat -z3

:0.0.4
modules\0.0.4.bat -LoadModule
