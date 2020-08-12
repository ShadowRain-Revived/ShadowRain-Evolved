@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-LoadModule" Goto RunModule
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:RunModule
Set "count=0"
Set "shadowDir=%cd%"
Cd "!currentDir!">Nul
If "!User!"=="" (
	ErrHndlr.bat -Error USER_NL00_0000
	Exit
)
Set Command=
Goto Entry
Exit

:Entry
Set /P Command="<%cd%> (~)> "
If "!Command!"=="" Goto Entry
If "!Command!"=="""" Goto Entry
If "!Command!"=="clear" Goto Clear
If "!Command!"=="cls" Goto Clear
If "!Command!"=="commands" Goto Help
If "!Command!"=="date" Goto Date
If "!Command!"=="dir" Goto Ls
If "!Command!"=="directexec" Goto DirectExec
If "!Command!"=="help" Goto Help
If "!Command!"=="internet" Goto NetHandler
If "!Command!"=="log" Goto Log
If "!Command!"=="ls" Goto Ls
If "!Command!"=="refresh" Goto Refresh
If "!Command!"=="root" Goto Root
If "!Command!"=="sysinfo" Goto SysInfo
If "!Command!"=="time" Goto Time
If "!Command!"=="update" Goto Update
For %%a In (!Command!) Do (
	Set /A count+=1
	Set Value!count!=%%a
)
If "!Value1!"=="cd" Goto Cd
If "!Value1!"=="color" Goto Color
If "!Value1!"=="md" Goto Mkdir
If "!Value1!"=="mkdir" Goto Mkdir
If "!Value1!"=="rd" Goto Rd
If "!Value1!"=="rmdir" Goto Rd
If "!Value1!"=="delfile" Goto DelFile
If "!Value1!"=="mkfile" Goto MkFile 
If "!Value1!"=="read" Goto ReadFile
Set Command=
Goto Entry

:Refresh
Set currentDir=%cd%
Cd !shadowDir!
Echo Console Refreshed.
EndLocal
modules\0.0.4.bat -LoadModule
Set Command=

:Ls
Dir
Set Command=
Goto Entry

:Cd
If Not Exist "!Value2!" (
	Echo This Directory does not exist.
	Set Command=
	Goto Entry
)
EndLocal & Pushd "%Value2%"
Set Command=
SetLocal EnableExtensions EnableDelayedExpansion
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
Echo 	- cd : Allows you to change directory (If it exists)
Echo 	- clear : (Alias: cls) Allows you to clear the console window
Echo 	- color : Allows you to change the color of the console window
Echo 	- date : Allows you to see the system date
Echo 	- delfile : Allows you to delete a file (Must specify extention)
Echo 	- dir : (Alias: ls) Allows you to see the directory you are in
Echo 	- help  (Alias: commands) Shows you this command dialog
Echo 	- internet : Allows you to access the internet (Opens default browser)
Echo 	- log : Allows you see both the date and time
Echo 	- mkdir : (Alias: md) Allows you to make a directory
Echo 	- mkfile : Allows you to make a file inside of a directory (Must specify file extention)
Echo 	- read : Allows you to read the contents of a document or file
Echo 	- rmdir : (Alias: rd) Allows you to delete a directory
Echo 	- root : Takes you back to the ShadowRain directory if you are in another directory
Echo 	- sysinfo  Shows you basic system information
Echo 	- time : Shows you the system time
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
If "!Value2!"=="" (
	Echo.
	Echo Please specifiy what directory to make.
	Set Command=
	Goto Loop
)
If Exist "!Value2!" (
	Echo.
	Echo This directory already exists.
	Set Command=
	Goto Loop
)
Mkdir "!Value2!"
Echo '!Value2!' has been made.
Set Command=
Goto Loop

:RD
If Not Exist "!Value2!" (
	Echo This directory does not exist.
	Set Command=
	Goto Loop
)
If "!Value3!"=="auto" (
	Echo '!Value2!' has been deleted.
	Rd /S /Q "!Value2!"
	Set Command=
	Goto Loop
)
Set /P "DeleteDir=Are you sure you wish to delete '!Value2!' (yes/no)? "
If "!DeleteDir!"=="yes" (
	Rd /S /Q "!Value2!"
	Echo '!Value2!' has been deleted.
	Set Command=
	Goto Loop
)
If "!DeleteDir!"=="no" (
	Echo '!Value2!' was kept.
	Set Command=
	Goto Loop
)
If Not "!DeleteDir!"=="yes" If Not "!DeleteDir!"=="no" (
	Echo Please answer yes or no only.
	Set Command=
	Goto Loop
)
Set Command=
Goto Loop

:Color
If "!Value2!"=="" (
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
	Echo Pick a color from the above, and run the command again. Or run "color reset" to return to default.
)
If "!Value2!"=="0" (
	Color 0
)
If "!Value2!"=="1" (
	Color 1
)
If "!Value2!"=="2" (
	Color 2
)
If "!Value2!"=="3" (
	Color 3
)
If "!Value2!"=="4" (
	Color 4
)
If "!Value2!"=="5" (
	Color 5
)
If "!Value2!"=="6" (
	Color 6
)
If "!Value2!"=="7" (
	Color 7
)
If "!Value2!"=="8" (
	Color 8
)
If "!Value2!"=="9" (
	Color 9
)
If "!Value2!"=="a" Set "Value2=A" && Goto Color
If "!Value2!"=="A" (
	Color A
)
If "!Value2!"=="b" Set "Value2=B" && Goto Color
If "!Value2!"=="B" (
	Color B
)
If "!Value2!"=="c" Set "Value2=C" && Goto Color
If "!Value2!"=="C" (
	Color C
)
If "!Value2!"=="d" Set "Value2=D" && Goto Color
If "!Value2!"=="D" (
	Color D
)
If "!Value2!"=="e" Set "Value2=E" && Goto Color
If "!Value2!"=="E" (
	Color E
)
If "!Value2!"=="f" Set "Value2=F" && Goto Color
If "!Value2!"=="F" (
	Color F
)
If "!Value2!"=="reset" (
	Color 0D
)
Set Command=
Goto Loop

:Loop
Set currentDir=%cd%
Cd !shadowDir!
EndLocal
modules\0.0.4.bat -LoadModule
Set Command=

:MkFile
If "!Value2!"=="" (
	Echo Please specify a file to create.
	Set Command=
	Goto Loop
)
If Exist "!Value2!" (
	Echo '!Value2!' already exists as a file.
	Set Command=
	Goto Loop
)
Set "Title=!Value2!"
Set /P "Text=What content do you wish to write to '!Title!'?: "  
If Not Exist "!Value2!" (
	Echo !Text! > "!Title!"
	Echo '!Title!' has been created with content: '!Text!'.
)
Set Command=
Goto Loop

:DelFile
If "!Value2!"=="" (
	Echo Please specify a file to delete.
	Set Command=
	Goto Loop
)
If Not Exist "!Value2!" (
	Echo '!Value2!' does not exist.
	Set Command=
	Goto Loop
)
If Exist "!Value2!"\* (
    Echo '!Value2!' is a directory. Use rmdir
    Set Command=
    Goto Loop
)
If "!Value3!"=="auto" (
	Echo '!Value2!' was deleted.
	Del /Q "!Value2!"
	Set Command=
	Goto Loop
)
Set /P "DelFile=Do you really want to delete '!Value2!'? (yes/no): "
If "!DelFile!"=="yes" (
	Echo '!Value2!' was deleted.
	Del /Q "!Value2!"
	Set Command=
	Goto Loop
)  
If "!DelFile!"=="no" (
	Echo '!Value2!' was kept.
	Set Command=
	Goto Loop
)
If Not "!DelFile!"=="yes" If Not "!DelFile!"=="no" (
	Echo Please answer yes or no only.
	Set Command=
	Goto Loop
)
Set Command=
Goto Loop

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
Echo Version: [ 0.0.4 ] - Release: [ Beta ]
Echo System Process ID: !SystemProcessID!
Echo.
Echo Check for new updates here: [ https://github.com/ShadowRain-Revived/ShadowRain-Evolved ] 
Echo For information join: [ https://discord.gg/VqjdxdE ]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Entry

:ReadFile
If "!Value2!"=="" (
	Echo Please specify a file to read.
	Set Command=
	Goto Loop
)
If Not Exist "!Value2!" (
	Echo That file does not exist or is unreadable.
	Set Command=
	Goto Loop
)
If Exist "!Value2!" (
	Type !Value2!
	Set ReadFile=
	Set Command=
	Goto Loop
)
Goto Loop

:NetHandler
:: Ignore this function, It is for testing only
Set /P NetSrc="URL?: "
Set "OriginString=!NetSrc!"
If Not "N!NetSrc:http://=!"=="N!NetSrc!" (
	:: Echo String Contains http://
	NetHndlr.bat -Http -CheckString
	Set Command=
	Goto Entry
)
If Not "N!NetSrc:https://=!"=="N!NetSrc!" (
	:: Echo String Contains https://
	NetHndlr.bat -Https -CheckString
	Set Command=
	Goto Entry
)
Echo "!NetSrc!" is not a valid website, Run the command and try again.
Set Command=
Goto Entry

:Update
Start https://update.shadowrain-revived.net/?version=!Version!
Set Command=
Goto Entry

:DirectExec
Set /P DirectCommand="Command?: "
!DirectCommand! && modules\0.0.4.bat -LoadModule
