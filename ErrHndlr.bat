@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
:: ShadowRain.bat missing all versions
If "%1"=="-Error" If "%2"=="MF00_SR00_0200" Goto CoreFile_ShadowRain_Missing
If "%1"=="-Error" If "%2"=="MF00_SR00_0300" Goto CoreFile_ShadowRain_Missing
If "%1"=="-Error" If "%2"=="MF00_SR00_0400" Goto CoreFile_ShadowRain_Missing
:: modules directory missing (universal)
If "%1"=="-Error" If "%2"=="MD00_ML00_0000" Goto CoreDirectory_ShadowRain_Missing
:: CommandEngine.bat missing all versions
If "%1"=="-Error" If "%2"=="MF00_CE00_0200" Goto CoreFile_CommandEngine_Missing
If "%1"=="-Error" If "%2"=="MF00_CE00_0300" Goto CoreFile_CommandEngine_Missing
If "%1"=="-Error" If "%2"=="MF00_CE00_0400" Goto CoreFile_CommandEngine_Missing
:: modules version file missing all versions
If "%1"=="-Error" If "%2"=="MFD0_ML00_0200" Goto CoreFile_Module_Missing
If "%1"=="-Error" If "%2"=="MFD0_ML00_0300" Goto CoreFile_Module_Missing
If "%1"=="-Error" If "%2"=="MFD0_ML00_0400" Goto CoreFile_Module_Missing
:: Encdec.bat missing all versions
If "%1"=="-Error" If "%2"=="MF00_ED00_0300" Goto CoreFile_Encdec_Missing
If "%1"=="-Error" If "%2"=="MF00_ED00_0400" Goto CoreFile_Encdec_Missing
:: UacSys.bat missing all versions
If "%1"=="-Error" If "%2"=="MF00_US00_0300" Goto CoreFile_UacSys_Missing
If "%1"=="-Error" If "%2"=="MF00_US00_0400" Goto CoreFile_UacSys_Missing
:: NetHndlr.bat missing all versions
If "%1"=="-Error" If "%2"=="MF00_NH00_0400" Goto CoreFile_NetHndlr_Missing
:: User Related Errors
If "%1"=="-Warn" If "%2"=="USER_SP00_0000" Goto UserSystem_User_Contains_Space
If "%1"=="-Warn" If "%2"=="USER_NL00_0000" Goto UserSystem_User_Contains_Null
If "%1"=="-Warn" If "%2"=="USER_PW00_0000" Goto UserSystem_Pass_Contains_Space
If "%1"=="-Warn" If "%2"=="USER_PW00_NL00" Goto UserSystem_Pass_Contains_Null
If "%1"=="-Warn" If "%2"=="USER_NX00_0000" Goto UserSystem_User_Missing_File
If "%1"=="-Warn" If "%2"=="USER_CT00_1800" Goto UserSystem_User_Contains_BadContent
If "%1"=="-Warn" If "%2"=="USER_PW00_NM00" Goto UserSystem_Pass_NoMatch
:: System Related Errors
If "%1"=="-Error" If "%2"=="SRST_0000_0000" Goto System_Version_IsNull
:: Network Related Errors
If "%1"=="-Warn" If "%2"=="NW00_BD00_0001" Goto Network_BadDomain_Porn
If "%1"=="-Warn" If "%2"=="NW00_BD00_0002" Goto Network_BadDomain_Download
If "%1"=="-Warn" If "%2"=="NW00_BD00_0003" Goto Network_BadDomain_Sex
If "%1"=="-Warn" If "%2"=="NW00_UKN0_0010" Goto Network_UnknownDomain
:: Unknown Errors
If "%1"=="-Error" If "%2"=="UKWN_9999_0000" Goto System_Unknown_Error
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:CoreFile_ShadowRain_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - ShadowRain.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreDirectory_ShadowRain_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : Directory Missing - modules
Echo            - Please add the missing directory and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreFile_CommandEngine_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - CommandEngine.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreFile_Module_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If "!Version!"=="0.0.2" Echo Error : File Missing - modules\0.0.2.bat
If "!Version!"=="0.0.3" Echo Error : File Missing - modules\0.0.3.bat
If "!Version!"=="0.0.4" Echo Error : File Missing - modules\0.0.4.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\modules
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreFile_Encdec_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - Encdec.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreFile_UacSys_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - UacSys.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:CoreFile_NetHndlr_Missing
Color 0C
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : File Missing - NetHndlr.bat
Echo            - Please locate the missing file and place it in this directory:
Echo                  - %cd%\
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:UserSystem_User_Contains_Space
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Username cannot contain a space.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser

:UserSystem_User_Contains_Null
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Username cannot be null (nothing).
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser

:UserSystem_Pass_Contains_Space
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Password cannot contain a space.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser

:UserSystem_Pass_Contains_Null
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Password cannot be null (nothing).
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser

:UserSystem_User_Missing_File
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Username is not a user on this system.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
If "!Version!"=="0.0.3" UacSys.bat -LoginVersion 0.0.3
If "!Version!"=="0.0.4" UacSys.bat -LoginVersion 0.0.4
Exit

:UserSystem_User_Contains_BadContent
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Username cannot contain graphic content.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser
:UserSystem_Pass_NoMatch
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Warn : Password does not match.
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to try again
Pause>Nul
UacSys.bat -MakeUser

:System_Unknown_Error
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo Error : An unknown error occured
Echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Echo.
Echo Press any key to terminate booting into ShadowRain
Pause>Nul
Exit

:Network_BadDomain_Download
Echo Warning : This domain contains "download" which is affiliated with virus/spyware programs, Would you like to proceed?
Set /P Proceed="Yes/No: "
If "!Proceed!"=="Yes" (
	Start !OriginString!
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
If "!Proceed!"=="No" (
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
Echo Please respond Yes or No
Goto Network_BadDomain_Download

:Network_BadDomain_Porn
Echo Warning : This domain contains "porn" which is affiliated with 18+ Content, Would you like to proceed?
Set /P Proceed="Yes/No: "
If "!Proceed!"=="Yes" (
	Start !OriginString!
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
If "!Proceed!"=="No" (
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
Echo Please respond Yes or No
Goto Network_BadDomain_Porn

:Network_BadDomain_Sex
Echo Warning : This domain contains "sex" which is affiliated with 18+ Content, Would you like to proceed?
Set /P Proceed="Yes/No: "
If "!Proceed!"=="Yes" (
	Start !OriginString!
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
If "!Proceed!"=="No" (
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
Echo Please respond Yes or No
Goto Network_BadDomain_Sex

:Network_UnknownDomain
Echo Warning : This domain isn't recognised by our firewall system, It may be risky. Would you like to proceed?
Set /P Proceed="Yes/No: "
If "!Proceed!"=="Yes" (
	Start !OriginString!
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
If "!Proceed!"=="No" (
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)
Echo Please respond Yes or No
Goto Network_UnknownDomain
