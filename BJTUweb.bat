@echo off
color f0

set username=19111111
set password=666666

title BJTUweb-%username%

:Pre
ping -n 1 10.10.42.3 >nul 2>nul
if errorlevel 1 goto Exit
if errorlevel 0 goto Begin

:Exit
echo %date:~0,10% %time:~0,8%  未接入校园网，不可认证
goto Delay

:Begin
ping -n 1 www.baidu.com >nul 2>nul
if errorlevel 1 goto Reboot
if errorlevel 0 goto Continue

:Continue
echo %date:~0,10% %time:~0,8%  已接入校园网，已认证，无需再次认证
goto Delay

:Reboot
echo %date:~0,10% %time:~0,8%  已接入校园网，但尚未认证，尝试自动认证
start msedge "http://10.10.43.3/drcom/login?callback=dr1610523868502&DDDDD=%username%&upass=%password%&0MKKey=123456"
goto Delay

:Delay
timeout /t 200
goto Pre
