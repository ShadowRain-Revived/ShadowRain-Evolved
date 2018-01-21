@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-mkusr" Goto MKUSR
If "%1"=="-chpwd" Goto ChangePWD
If "%1"=="-auth" If "%2"=="%User%" Goto Authenticate
If "%1"=="-rp" If "%2"=="%realPass%" Goto CheckUser
If "%1"=="-LGN" If "%2%"=="0.0.3" Goto Login

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined.
Exit

:Login
Cls
Color 0D
If Not Exist usr Mkdir usr
If Not Exist usr\*.usr Goto MKUSR
If Exist usr\*.usr Set /P Choice="[1] Login [2] New Account: "
If "%Choice%"=="1" Goto Sign_In
If "%Choice%"=="2" Goto MKUSR
If Not "%Choice%"=="1" If Not "%Choice%"=="2" (
	Echo Please choose one of the options above.
	Pause>Nul
	Goto Login
)

:Sign_In
Cls
Set /P User="Username?: "
If "%User%"==" "%User% If "%User%"==%User%" " (
	Echo That username is invalid. Remove the space.
	Pause>Nul
	Goto Login
)
If "%User%"=="" Goto Sign_In
If Exist usr\*%User%.usr Goto AUTHENTICATE
If Not Exist usr\%User%.usr ErrHndlr.bat -E 02_01_00

:MKUSR
Cls
Set /P "User=Select a username: "
If Exist usr\%User%.usr Goto NAME_IN_USE
If "%User%"==" "%User% If "%User%"==%User%" " (
	Echo Error, remove the space before continuing.
	Pause>Nul
	Goto MKUSR
)
If "%User%"==" " (
	Echo Error, you must enter a username.
	Pause>Nul
	Goto MKUSR
)
If "%User%"=="" (
	Echo Error, you must enter a username.
	Pause>Nul
	Goto MKUSR
)
If Not Exist usr\%User%.usr Goto MKPWD

:MKPWD
Set /P "Password=Password? (a-z, A-Z, 0-9): "
If "%Password%"==" "%Password% If "%Password%"==%Password%" " (
	Echo Error, remove the space before continuing.
	Pause>Nul
	Goto MKPWD
)
If "%Password%"=="" (
	Echo You must enter a password before continuing!
	Pause>Nul
	Goto MKPWD
)
Set /P "confPass=Confirm Password?: "
If "%confPass%"==" "%confPass% If "%confPass%"==%confPass%" " (
	Echo Error, remove the space before continuing.
	Pause>Nul
	Goto MKPWD
)
If "%confPass%"=="" (
	Echo You must enter a password before continuing!
	Pause>Nul
	Goto MKPWD
)
If "%Password%"=="%confPass%" Goto USR_Create
Goto Incorrect_Pass

:USR_CREATE
If Exist usr\%User%.usr Goto EncryptStg1
If Not Exist usr\%User%.usr (
	Echo %User% > usr\%User%.usr
	Echo '%User%' was created on the system.
	Goto EncryptStg1
) Else (
	Color 0C
	Echo An error occured.
	Goto EXT
)

:NAME_IN_USE
Echo.
Echo This name already exists on the system.
Echo.
Pause>Nul
Goto MKUSR

:Authenticate
Set /P Password="Password?: "
If "%Password%"==" "%Password% If "%Password%"==%Password%" " (
	Echo Error, you must remove all spaces in the password.
	Pause>Nul
	Goto Authenticate
)
If "%Password%"=="" (
	Echo You must enter a password before continuing!
	Pause>Nul
	Goto Authenticate
)
Set /P "confPass=Confirm Password?: "
If "%confPass%"==" "%confPass% If "%confPass%"==%confPass%" " (
	Echo That password is invalid, please remove the space.
	Pause>Nul
	Goto Authenticate
)
If "%confPass%"=="" (
	Echo Error, you must remove all spaces in the password.
	Pause>Nul
	Goto Authenticate
)
If Exist usr\%User%.usr Goto AuthStg2

:AuthStg2
If "%Password%"=="%confPass%" Goto AuthStg3
Goto Incorrect_Pass

:AuthStg3
Encdec.bat -u %User% -p %confPass%
Exit

:EncryptStg1
Set "User=%User%"
Set "Password=%confPass%"
If Exist usr\%User%.usr Goto EncryptStg2
Goto MKUSR

:EncryptStg2
If "%Password%"=="%confPass%" Goto EncryptStg3
Goto Incorrect_Pass

:EncryptStg3
Encdec.bat -a %User% -p %confPass%

:CheckUser
If "%confPass%"=="%realPass%" Goto UserOk
Goto Incorrect_Pass

:UserOk
Cls
ShadowRain.bat -a OK

:ChangePWD
Goto MKPWD

:EXT
Exit

:Incorrect_Pass
Echo Passwords do not match.
Pause>Nul
Goto Login