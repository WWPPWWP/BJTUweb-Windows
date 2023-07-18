@echo off
color f0

set username=19111111
set password=111111

title BJTUweb-%username%

:Pre
echo %date:~0,10% %time:~0,8%  开始检测网络状态
ping -n 1 10.10.43.3 >nul 2>nul
if errorlevel 1 goto Exit
if errorlevel 0 goto Begin

:Exit
echo %date:~0,10% %time:~0,8%  ×无法访问10.10.43.3
set delaytime=100
goto Delay

:Begin
ping -n 1 www.baidu.com >nul 2>nul
if errorlevel 1 goto Reboot
if errorlevel 0 goto Continue

:Continue
echo %date:~0,10% %time:~0,8%  √已登录校园网
set delaytime=1000
goto Delay

:Reboot
echo %date:~0,10% %time:~0,8%  ×未登录校园网
curl -d "DDDDD=%username%&upass=%password%&0MKKey=" http://10.10.43.3 >nul
ping -n 1 www.baidu.com >nul 2>nul
if errorlevel 1 goto Fail
if errorlevel 0 goto Success

:Fail
echo %date:~0,10% %time:~0,8%  ×登录失败（%username%）
set delaytime=100
goto Delay

:Success
echo %date:~0,10% %time:~0,8%  √登录成功（%username%）
set delaytime=1000
goto Delay

:Delay
timeout /t %delaytime%
goto Pre
