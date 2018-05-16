@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-z3" Goto Exec
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:Exec
Set shadowDir=%cd%
Cd !currentDir!>Nul
If "!User!"=="" (
	..\ErrHndlr.bat -E E0_03_01
	Exit
)
Set Command=
Goto Entry
Exit

:Entry
Set /P Command="<%cd%> (~)> "
If "!Command!"=="" Goto Entry
If "!Command!"=="""" Goto Entry
If "!Command!"=="cls" Goto Clear
If "!Command!"=="clear" Goto Clear
If "!Command!"=="help" Goto Help
If "!Command!"=="commands" Goto Help
If "!Command!"=="refresh" Goto Refresh
If "!Command!"=="dir" Goto Ls
If "!Command!"=="ls" Goto Ls
If "!Command!"=="cd" Goto Cd
If "!Command!"=="root" Goto Root
If "!Command!"=="time" Goto Time
If "!Command!"=="mkdir" Goto MkDir
If "!Command!"=="md" Goto Mkdir
If "!Command!"=="rd" Goto Rd
If "!Command!"=="rmdir" Goto Rd
If "!Command!"=="color" Goto Color
If "!Command!"=="mkfile" Goto MkFile
If "!Command!"=="delfile" Goto DelFile
If "!Command!"=="date" Goto Date
If "!Command!"=="log" Goto Log
If "!Command!"=="sysinfo" Goto SysInfo
If "!Command!"=="chpwd" Goto PWDChange
Set Command=
Goto Entry

:Refresh
Set currentDir=%cd%
Cd !shadowDir!
Echo Console Refreshed.
modules\0.0.3.bat -z3
Set Command=

:Ls
Dir
Set Command=
Goto Entry

:Cd
Set /P Directory="What directory? "
If Not Exist "!Directory!" (
	Echo This Directory does not exist.
	Set Command=
	Goto Entry
)
Cd "!Directory!"
Set Command=
Goto Entry

:Root
Cd !shadowDir!
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
Echo  - refresh -- Refreshes the Console Window (For Updates - Mainly a dev command :
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
Echo  - sysinfo -- Displays the system information
Echo  - chpwd -- Allows you to change your password
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Entry

:Time
Echo The System Time is [%Time%].
Set Command=
Goto Entry

:MkDir
Set /P Dir="Name your desired directory: "
Mkdir !Dir!
Echo '!Dir!' has been made.
Set Command=
Goto Entry

:RD
Set /P REDIR="Which directory do you wish to delete?: "
If Not Exist "!reDir!" (
	Echo This directory does not exist.
	Set Command=
	Goto Entry
)
Set /P Confirm="Are you sure you want to delete '!reDir!?' (yes/no): "
If "!Confirm!"=="yes" (
	Rd /S /Q !reDir!
	Echo '!reDir!' has been deleted.
)
If Not "!Confirm!"=="yes" If Not "!Confirm!"=="no" (
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
Color !Col!
Set Command=
Goto Entry

:MkFile
Set /P Title="Enter a title for your file (Specify ext): "
Set /P Text="Write your text here: "
If Exist "!Title!" Echo This file already exists.
    
If Not Exist "!Title!" (
	Echo "!Text!" > "!Title!"
	Echo '!Title!' has been created.
)
Set Command=
Goto Entry

:DelFile
Set /P DLFile="Which file do you want to delete?: "
If Not Exist "!DLFile!" (
	Echo '!DLFile!' does not exist.
	Set Command=
	Goto Entry
)
If Exist "!DLFile!"\* (
    Echo '!DLFile!' is a directory. Use rmdir
    Set Command=
    Goto Entry
)
Set /P Response="Do you really want to delete '!DLFile!'? (yes/no): "
If "!Response!"=="yes" (
	Del /Q !DLFile!
	Set Command=
	Goto Entry
)  
If "!Response!"=="no" (
	Set Command=
	Goto Entry
)
If Not "!Response!"=="yes" If Not "!Response!"=="no" (
	Echo Please answer yes or no only.
	Set Command=
	Goto Entry
)
Set Command=
Goto Entry

:Date
Echo Today's date is [%Date%]
Set Command=
Goto Entry

:Log
Echo.
Echo %Date% %Time%
Echo.
Set Command=
Goto Entry

:SysInfo
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo You are currently logged in as "!User!"
Echo Version: [ 0.0.3 ] - Release: [ Alpha ]
Echo.
Echo New updates here: [ https://github.com/ShadowRain-Revived/ShadowRain ] 
Echo For information join: [ https://discord.gg/VqjdxdE ]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Entry

:PWDChange
UacSys.bat -chpwd
Set Command=
Goto Entry
