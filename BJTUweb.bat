@echo off
color f0

set username=19111039
set password=ddrrxx

title BJTUweb-%username%

:Pre
ping -n 1 10.10.42.3 >nul 2>nul
if errorlevel 1 goto Exit
if errorlevel 0 goto Begin

:Exit
echo %date:~0,10% %time:~0,8%  ��δ����У԰����������֤
goto Delay

:Begin
ping -n 1 www.baidu.com >nul 2>nul
if errorlevel 1 goto Reboot
if errorlevel 0 goto Continue

:Continue
echo %date:~0,10% %time:~0,8%  ���ѽ���У԰��������֤�������ٴ���֤
goto Delay

:Reboot
echo %date:~0,10% %time:~0,8%  ���ѽ���У԰��������δ��֤�������Զ���֤
start msedge "http://10.10.43.3/drcom/login?callback=dr1610523868502&DDDDD=%username%&upass=%password%&0MKKey=123456"
goto Delay

:Delay
timeout /t 200
goto Pre