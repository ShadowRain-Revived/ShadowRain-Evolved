@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
:: Login Things
If "%1"=="-LoginVersion" If "%2"=="0.0.3" Goto Login
If "%1"=="-LoginVersion" If "%2"=="0.0.4" Goto Login
:: User Things (Make_User : Line 38) 
If "%1"=="-MakeUser" Goto Make_User
If "%1"=="-ChangePassword" Goto Change_Password
:: Authentication Things
If "%1"=="-Authenticate" If "%2"=="!CheckedPass!" Goto Authenticated_User
ErrHndlr.bat -Error UKWN_9999_0000

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined.
Exit

:Login
Cls
Color 0D
If Not Exist usr Mkdir usr
If Not Exist usr\*.usr Goto Make_User
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Type "login" to login to ShadowRain
Echo Type "newuser" to make a new user account
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If Exist usr\*.usr Set /P Login_Option="Option?: "
:: Skip to Line 95 to edit User_Login
If "!Login_Option!"=="login" Goto User_Login
If "!Login_Option!"=="newuser" UacSys.bat -MakeUser
Echo Please choose from the options above.
Pause>Nul
Goto Login

:Make_User
Cls
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Welcome to the ShadowRain User Account Creation Area
Echo.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Set /P "User=What username would you like?: "
If Exist usr\!User!.usr (
	Echo Sorry! That name already exists.
	Goto Make_User
)
If "!User!"==" "!User! If "!User!"==!User!" " (
	ErrHndlr.bat -Warn USER_SP00_0000
)
If "!User!"==" " (
	ErrHndlr.bat -Warn USER_SP00_0000
)
If "!User!"=="" (
	ErrHndlr.bat -Warn USER_NL00_0000
)
If Not "U!User:cock=!"=="U!User!" ErrHndlr.bat -Warn USER_CT00_1800
If Not "U!User:porn=!"=="U!User!" ErrHndlr.bat -Warn USER_CT00_1800
If Not "U!User:sex=!"=="U!User!" ErrHndlr.bat -Warn USER_CT00_1800
If Not "U!User:vagina=!"=="U!User!" ErrHndlr.bat -Warn USER_CT00_1800
Goto Make_Password

:Make_Password
Set /P "Password=Password to login with? (a-z, A-Z, 0-9): "
If "!Password!"==" "!Password! If "!Password!"==!Password!" " (
	ErrHndlr.bat -Warn USER_PW00_0000
)
If "!Password!"=="" (
	ErrHndlr.bat -Warn USER_PW00_NL00
)
Set /P "Confirm_Password=Confirm Password?: "
If "!Confirm_Password!"==" "!Confirm_Password! If "!Confirm_Password!"==!Confirm_Password!" " (
	ErrHndlr.bat -Warn USER_PW00_0000
)
If "!Confirm_Password!"=="" (
	ErrHndlr.bat -Warn USER_PW00_NL00
)
If "!Password!"=="!Confirm_Password!" (
	If Not Exist usr\!User!.usr (
		Echo !User! > usr\!User!.usr
		Echo "!User!" was created on the system.
		Goto Encryption_Tree
	) Else (
		Goto Encryption_Tree
	)
) Else (
	ErrHndlr.bat -Warn USER_PW00_NM00
)

:Encryption_Tree
Encdec.bat -AddUser !User! -Password !Password!

:User_Login
Set /P "User=Username?: "
If Not Exist usr\!User!.usr (
	ErrHndlr.bat -Warn USER_NX00_0000
)
Set /P "Password=Password?: "
If "!Password!"==" "!Password! If "!Password!"==!Password!" " (
	ErrHndlr.bat -Warn USER_PW00_0000
)
If "!Password!"=="" (
	ErrHndlr.bat -Warn USER_PW00_NL00
)
Encdec.bat -CheckUser !User! -Password !Password!

:Authenticated_User
If "!Password!"=="!CheckedPass!" (
	If "!Version!"=="0.0.3" (
		ShadowRain.bat -Authenticate 0.0.3
	)
	If "!Version!"=="0.0.4" (
		ShadowRain.bat -Authenticate 0.0.4
	)
)
ErrHndlr.bat -Warn USER_PW00_NM00
