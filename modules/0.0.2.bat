@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-z2" Goto Exec
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:Exec
Set shadowDir=%cd%
Cd %currentDir%>Nul
Set Command=
Goto Entry
Exit

:Entry
Set /P Command="<%cd%> (~)> "
If "%Command%"=="" Goto Entry
If "%Command%"=="""" Goto Entry
If "%Command%"=="cls" Goto Clear
If "%Command%"=="clear" Goto Clear
If "%Command%"=="help" Goto Help
If "%Command%"=="commands" Goto Help
If "%Command%"=="refresh" Goto Refresh
If "%Command%"=="logout" Goto Logout
If "%Command%"=="ls" Goto Ls
If "%Command%"=="cd" Goto Cd
If "%Command%"=="root" Goto Root
If "%Command%"=="time" Goto Time
If "%Command%"=="mkdir" Goto MkDir
If "%Command%"=="md" Goto Mkdir
If "%Command%"=="rd" Goto Rd
If "%Command%"=="rmdir" Goto Rd
If "%Command%"=="color" Goto Color
If "%Command%"=="mkfile" Goto MkFile
If "%Command%"=="delfile" Goto DelFile
If "%Command%"=="date" Goto Date
If "%Command%"=="log" Goto Log
Set Command=
Goto Entry

:Refresh
Set currentDir=%cd%
Cd %shadowDir%
Echo Console Refreshed.
modules\0.0.2.bat -z2
Set Command=

:Logout
Cd %shadowDir%
Startup.bat

:Ls
Dir
Set Command=
Goto Entry

:Cd
Set /P Directory="What directory? "
Cd %Directory%
Set Command=
Goto Entry

:Root
Cd %shadowDir%
Set Command=
Goto Entry

:Clear
Cls
Set Command=
Goto Entry

:Help
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo ShadowRain Command List:
Echo.
Echo  - clear (Alias : cls) -- Clears the Console Window
Echo  - refresh -- Refreshes the Console Window (For Updates - Mainly a dev command :P)
Echo  - logout -- Logout of ShadowRain back to the Startup Menu
Echo  - root -- Takes you to the directory of these files (If you're in another directory)
Echo  - ls -- Shows the files in the directory
Echo  - cd -- Allows you to change directory
Echo  - help (Alias : commands) -- Shows this dialog
Echo  - time -- Shows the system time
Echo  - mkdir (Alias: md) -- Allows you to make a directory
Echo  - rmdir (Alias: rd) -- Allows you to delete a directory
Echo  - color -- Allows you to change the color in the console
Echo  - mkfile -- Allows you to make a file inside a directory (must specify ext)
Echo  - delfile -- Allows you to delete a file (must specify ext)
Echo  - date -- Displays the system date
Echo  - log -- Displays the system time and date
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Entry

:Time
Echo The System Time is [%time%].
Set Command=
Goto Entry

:MkDir
Set /P DIR="Name your desired directory: "
Mkdir %DIR%
Echo '%DIR%' has been made.
Set Command=
Goto Entry

:RD
Set /P REDIR="Which directory do you wish to delete?: "
If Not Exist %REDIR% (
	Echo This directory does not exist.
	Set Command=
	Goto Entry
)
Set /P CONFIRM="Are you sure you want to delete '%REDIR%?' (yes/no): "
If "%CONFIRM%"=="yes" (
	Rd /S /Q %REDIR%
	Echo '%REDIR%' has been deleted.
)
If Not "%CONFIRM%"=="yes" If Not "%CONFIRM%"=="no" (
	Echo Please answer yes or no only.
)
Set Command=
Goto Entry

:Color
Echo.
Echo 0 = Black       8 = Gray
Echo 1 = Blue        9 = Light Blue
Echo 2 = Green       A = Light Green
Echo 3 = Aqua        B = Light Aqua
Echo 4 = Red         C = Light Red
Echo 5 = Purple      D = Light Purple
Echo 6 = Yellow      E = Light Yellow
Echo 7 = White       F = Bright White
Echo.
Set /P Col="Pick a color: "
Color %Col%
Set Command=
Goto Entry

:MkFile
Set /P Title="Enter a title (Specify ext): "
Set /P Text="Write here: "
If Exist %TITLE% Echo This file already exists.
    
If Not Exist %TITLE% (
	Echo %TEXT% > %Title%
	Echo '%Title%' has been created.
)
Set Command=
Goto Entry

:DelFile
Set /P ASK="Which file do you want to delete?: "
If Not Exist %ASK% (
	Echo '%ASK%' does not exist.
	Set Command=
	Goto Entry
)
If Exist %ASK%\* (
    Echo '%ASK%' is a directory. Use mkdir
    Set Command=
    Goto Entry
)

Set /P YN="Do you really want to delete '%ASK%'? (yes/no): "
If "%YN%"=="yes" (
	Del /Q %ASK%
	Set Command=
	Goto Entry
)  
If "%YN%"=="no" (
	Set Command=
	Goto Entry
)

If Not "%YN%"=="yes" If Not "%YN%"=="no" (
	Echo Please answer yes or no only.
	Set Command=
	Goto Entry
)

Set Command=
Goto Entry

:Date
Echo Today's date is [%date%]
Set Command=
Goto Entry

:Log
Echo.
Echo %date% %time%
Echo.
Set Command=
Goto Entry
