
:: http://www.robvanderwoude.com/clevertricks.php
:: Ensure ADMIN Privileges
:: adaptation of https://sites.google.com/site/eneerge/home/BatchGotAdmin and http://stackoverflow.com/q/4054937
@echo off
at > null
if '%errorlevel%' NEQ '0' (
    REM Get ADMIN Privileges
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    REM exit /B
) else (
    REM Got ADMIN Privileges
    pushd "%cd%"
    cd /d "%~dp0"
    @echo on
)

FOR /F "tokens=3 delims= " %%A IN ('netsh interface show interface "Wireless Network Connection"  ^| find "Connect state"') DO SET WLANSTATE=%%A

IF %WLANSTATE%==Connected netsh interface set interface "Wireless Network Connection" Disable
IF %WLANSTATE%==Disconnected netsh interface set interface "Wireless Network Connection" Enable