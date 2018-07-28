@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto NO_PARAM
If "%1"=="-http" If "%2"=="-check" Goto HttpCheck
If "%1"=="-https" If "%2"=="-check" Goto HttpsCheck
Exit

:NO_PARAM
Color 0C
Echo -- Unable to run file - No parameter is defined, Returning to boot menu.
Exit

:HttpCheck
:: Common FQDN Check
If Not "N!OriginString:.net=!"=="N!OriginString!" (
    :: URL contains .net
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    Pause>Nul
    Exit
)
If Not "N!OriginString:.com=!"=="N!OriginString!" (
    :: URL contains .com
    Echo URL contains .com
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:download=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:sex=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:xxx=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:redtube=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:xnxx=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:xhamster=!"=="N!OriginString" (
        ErrHndlr.bat -E SOME_ERROR
    )
    Pause>Nul
    Exit
)
If Not "N!OriginString:.co.uk=!"=="N!OriginString!" (
    :: URL contains .co.uk
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    Pause>Nul
    Exit
)
If Not "N!OriginString:.co=!"=="N!OriginString!" (
    :: URL contains .co
    If Not "N!OriginString:porn=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:download=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    If Not "N!OriginString:sex=!"=="N!OriginString!" (
        ErrHndlr.bat -E SOME_ERROR
    )
    Pause>Nul
    Exit
)
:: URL is not known by the HttpCheck
Echo URL is unknown by HttpCheck
Pause>Nul
Exit

:HttpsCheck
:: ShadowRain domain should be the first to actually function for update commands
If Not "N!OriginString:update.shadowrain-revived.net=!"=="N!OriginString!" (
    Start https://update.shadowrain-revived.net/
    :: This is debugging
    Echo Started browser and opened !OriginString! ...
    Set OriginString=
    modules\0.0.4.bat -z4
)
:: GOV domains should always be Https
If Not "N!OriginString:.gov=!"=="N!OriginString!" (
    :: URL contains .gov
    Echo URL contains .gov [Https]
    Pause>Nul
    Exit
)
If Not "N!OriginString:.net=!"=="N!OriginString!" (
    :: URL contains .net
    Echo URL contains .net [Https]
    Pause>Nul
    Exit
)
If Not "N!OriginString:.com=!"=="N!OriginString!" (
    :: URL contains .com
    Echo URL contains .com [Https]
    Pause>Nul
    Exit
)
If Not "N!OriginString:.co.uk=!"=="N!OriginString!" (
    :: URL contains .co.uk
    Echo URL contains .co.uk [Https]
    Pause>Nul
    Exit
)
If Not "N!OriginString:.co=!"=="N!OriginString!" (
    :: URL contains .co
    Echo URL contains .co [Https]
    Pause>Nul
    Exit
)
:: URL is not known by the HttpsCheck
Echo URL is unknown by HttpsCheck
Pause>Nul
Exit
