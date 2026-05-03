@echo off
chcp 65001 >nul
cd /d "%~dp0"

setlocal enabledelayedexpansion

set "pda="%~dp0files\pda.bin""
set "stun="%~dp0files\stun.bin""
set "ignore="%~dp0files\ignore.txt""
set "youtube="%~dp0files\youtube.txt""
set "quicgoogle="%~dp0files\quic_initial_www_google_com.bin""
set "tlsgoogle="%~dp0files\tls_clienthello_www_google_com.bin""

set "args="

for /f "usebackq delims=" %%A in ("%~dp0files\config_v4.txt") do (
    set "line=%%A"
    set "line=!line:{pda}=%pda%!"
    set "line=!line:{stun}=%stun%!"
    set "line=!line:{ignore}=%ignore%!"
    set "line=!line:{youtube}=%youtube%!"
    set "line=!line:{tlsgoogle}=%tlsgoogle%!"
    set "line=!line:{quicgoogle}=%quicgoogle%!"

    set "args=!args! !line!"
)

start "ZapretOzz" "files\winws.exe" !args!