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
If "!Command!"=="cd" Goto Cd
If "!Command!"=="chpwd" Goto PWDChange
If "!Command!"=="clear" Goto Clear
If "!Command!"=="cls" Goto Clear
If "!Command!"=="color" Goto Color
If "!Command!"=="commands" Goto Help
If "!Command!"=="date" Goto Date
If "!Command!"=="delfile" Goto DelFile
If "!Command!"=="dir" Goto Ls
If "!Command!"=="help" Goto Help
If "!Command!"=="internet" Goto NetHandler
If "!Command!"=="log" Goto Log
If "!Command!"=="ls" Goto Ls
If "!Command!"=="md" Goto Mkdir
If "!Command!"=="mkdir" Goto Mkdir
If "!Command!"=="mkfile" Goto MkFile
If "!Command!"=="rd" Goto Rd
If "!Command!"=="read" Goto ReadFile
If "!Command!"=="refresh" Goto Refresh
If "!Command!"=="rmdir" Goto Rd
If "!Command!"=="root" Goto Root
If "!Command!"=="sysinfo" Goto SysInfo
If "!Command!"=="time" Goto Time
Set Command=
Goto Entry

:Refresh
Set currentDir=%cd%
Cd !shadowDir!
Echo Console Refreshed.
modules\0.0.4.bat -LoadModule
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
Echo 	- cd : Allows you to change directory (If it exists)
Echo 	- chpwd : Allows you to change your password
Echo 	- clear : (Alias: cls) Allows you to clear the console window
Echo 	- color : Allows you to change the color of the console window
Echo 	- date : Allows you to see the system date
Echo 	- delfile : Allows you to delete a file (Must specify extention)
Echo 	- dir : (Alias: ls) Allows you to see the directory you are in
Echo 	- help  (Alias: commands) Shows you this command dialog
Echo 	- internet : Allows you to access the internet (Opens default browser)
Echo 	- log : Allows you see both the date and time
Echo 	- mkdir : (Alias: md) Allows you to make a directory
Echo 	- mkfile : Allows you to make a file inside of a directory (Must specify extention)
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
Set /P Dir="Name your desired directory: "
Mkdir "!Dir!"
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
	Rd /S /Q "!reDir!"
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
    Echo '!DLFile!' is a directory. Use mkdir
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
Echo Version: [ 0.0.4 ] - Release: [ Alpha ]
Echo System Process ID: !SystemProcessID!
Echo.
Echo Check for new updates here: [ https://github.com/ShadowRain-Revived/ShadowRain ] 
Echo For information join: [ https://discord.gg/VqjdxdE ]
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Set Command=
Goto Entry

:ReadFile
Set /P ReadFile="Read which file?: "
If Not Exist "!ReadFile!" (
	Echo That file does not exist, Unreadable.
	Set Command=
	Set ReadFile=
	Goto Entry
)
If Exist "!ReadFile!" (
	Write !ReadFile!
	Set ReadFile=
	Set Command=
	Goto Entry
)
:PWDChange
UacSys.bat -chpwd
Set Command=
Goto Entry

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
