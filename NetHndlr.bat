@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-Http" If "%2"=="-CheckString" Goto HttpCheck
If "%1"=="-Https" If "%2"=="-CheckString" Goto HttpsCheck
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:HttpCheck
If "!User!"=="" (
	Goto NO_PARAM
)

:: ShadowRain domain should be the first to actually function
If Not "N!OriginString:shadowrain-revived.net=!"=="N!OriginString!" (
	Start https://shadowrain-revived.net/
	Set OriginString=
	modules\0.0.4.bat -LoadModule
)

:: Common FQDN Check
If Not "N!OriginString:.net=!"=="N!OriginString!" (
    :: URL contains .net
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.com=!"=="N!OriginString!" (
    :: URL contains .com
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.co.uk=!"=="N!OriginString!" (
    :: URL contains .co.uk
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.co=!"=="N!OriginString!" (
    :: URL contains .co
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

:: URL is not known by the HttpCheck
ErrHndlr.bat -Warn NW00_UKN0_0010

:HttpsCheck
If "!User!"=="" (
	Goto NO_PARAM
)

:: GOV domains should always be Https
If Not "N!OriginString:.gov=!"=="N!OriginString!" (
    :: URL contains .gov
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.net=!"=="N!OriginString!" (
    :: URL contains .net
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.com=!"=="N!OriginString!" (
    :: URL contains .com
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.co.uk=!"=="N!OriginString!" (
    :: URL contains .co.uk
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

If Not "N!OriginString:.co=!"=="N!OriginString!" (
    :: URL contains .co
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0002
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0001
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString!" (
		ErrHndlr.bat -Warn NW00_BD00_0003
    )
	Start !OriginString!
	modules\0.0.4.bat -LoadModule
)

:: URL is not known by the HttpsCheck
ErrHndlr.bat -Warn NW00_UKN0_0010
