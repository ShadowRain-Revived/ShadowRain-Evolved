@Echo off
If "%1"=="" Goto NO_PARAM
If "%1"=="-z1" Goto Entry
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:Entry
Set /P Command="<%cd%> (~)> "
If "%Command%"=="" Goto Entry
If "%Command%"=="""" Goto Entry
If "%Command%"=="test" Goto Test
If "%Command%"=="refresh" Goto Refresh
If "%Command%"=="logout" Goto Logout
If "%Command%"=="ls" Goto Ls
Goto Entry

:Test
Echo OK
Goto Entry

:Refresh
Echo Console Refreshed.
modules\0.0.1.bat -z1

:Logout
Startup.bat

:Ls
Dir
Goto Entry
