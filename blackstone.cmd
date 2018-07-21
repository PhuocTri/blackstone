@echo off
color 3
for /f %%i in ("%0") do set scriptPath=%%~dpi
echo.
echo.
echo.
echo This batch script automatic generate a genuineticket for your current Windows 10 Edition
echo then activate Windows 10 permanently when computer connected to the internet.
echo.
echo For first, we'll removing any installed Windows product key
cscript -nologo %windir%\system32\slmgr.vbs -upk
echo Determining Windows Edition
wmic os get caption | find "Home N" > nul
if %errorlevel% == 0 ( goto HomeN ) else ( goto findHomeSL )

:findHomeSL
wmic os get caption | find "Home Single Language" > nul
if %errorlevel% == 0 ( goto HomeSL ) else ( goto findHome )

:findHome
wmic os get caption | find "Home" > nul
if %errorlevel% == 0 ( goto Home ) else ( goto findProN )

:findProN
wmic os get caption | find "Pro N" > nul
if %errorlevel% == 0 ( goto ProN ) else ( goto findProSL )

:findProSL
wmic os get caption | find "Pro Single Language" > nul
if %errorlevel% == 0 ( goto ProSL ) else ( goto findProEN )

:findProEN
wmic os get caption | find "Pro Education N" > nul
if %errorlevel% == 0 ( goto ProEN ) else ( goto findProE )

:findProE
wmic os get caption | find "Pro Education" > nul
if %errorlevel% == 0 ( goto ProE ) else ( goto findProNW )

:findProNW
wmic os get caption | find "Pro N for Workstations" > nul
if %errorlevel% == 0 ( goto ProNW ) else ( goto findProW )

:findProW
wmic os get caption | find "Pro for Workstations" > nul
if %errorlevel% == 0 ( goto ProW ) else ( goto findPro )

:findPro
wmic os get caption | find "Pro" > nul
if %errorlevel% == 0 ( goto Pro ) else ( goto findEN )

:findEN
wmic os get caption | find "Education N" > nul
if %errorlevel% == 0 ( goto EduN ) else ( goto findE )

:findE
wmic os get caption | find "Education" > nul
if %errorlevel% == 0 ( goto Edu ) else ( goto findEnt )

:findEnt
wmic os get caption | find "Enterprise" > nul
if %errorlevel% == 0 ( goto Ent ) else ( goto notSupported )

:HomeN
echo Windows 10 Home N Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 98 /f
echo.
echo Installing Windows 10 Home N default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk 4CPRK-NM3K3-X6XXQ-RXX86-WXCHW
goto setRegistry

:HomeSL
echo Windows 10 Home Single Language Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 100 /f
echo.
echo Installing Windows 10 Home Single Language default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
goto setRegistry

:Home
echo Windows 10 Home Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 101 /f
echo.
echo Installing Windows 10 Home default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk YTMG3-N6DKC-DKB77-7M9GH-8HVX7
goto setRegistry

:ProN
echo Windows 10 Pro N Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 49 /f
echo.
echo Installing Windows 10 Pro N default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk 2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
goto setRegistry

:ProSL
echo Windows 10 Pro Single Language Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 48 /f
echo.
echo Installing Windows 10 Pro Single Language default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk G3KNM-CHG6T-R36X3-9QDG6-8M8K9
goto setRegistry

:ProEN
echo Windows 10 Pro Education N Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 165 /f
echo.
echo Installing Windows 10 Pro Education N default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk GJTYN-HDMQY-FRR76-HVGC7-QPF8P
goto setRegistry

:ProE
echo Windows 10 Pro Education Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 164 /f
echo.
echo Installing Windows 10 Pro Education default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk 8PTT6-RNW4C-6V7J2-C2D3X-MHBPB
goto setRegistry

:ProNW
echo Windows 10 Pro N for Workstations Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 162 /f
echo.
echo Installing Windows 10 Pro N for Workstations default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk WYPNQ-8C467-V2W6J-TX4WX-WT2RQ
goto setRegistry

:ProW
echo Windows 10 Pro for Workstations Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 161 /f
echo.
echo Installing Windows 10 Pro for Workstations default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk DXG7C-N36C4-C4HTG-X4T3X-2YV77
goto setRegistry

:Pro
echo Windows 10 Pro Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 48 /f
echo.
echo Installing Windows 10 Pro default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T
goto setRegistry

:EduN
echo Windows 10 Education N Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 122 /f
echo.
echo Installing Windows 10 Education N default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk 84NGF-MHBT6-FXBX8-QWJK7-DRR8H
goto setRegistry

:Edu
echo Windows 10 Education Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 121 /f
echo.
echo Installing Windows 10 Education default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY
goto setRegistry

:Ent
echo Windows 10 Enterprise Edition determined.
echo.
echo Set Windows SKU
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d 4 /f
echo.
echo Installing Windows 10 Enterprise default retail product key
cscript -nologo %windir%\system32\slmgr.vbs -ipk XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
goto setRegistry

:notSupported
echo Your current Windows 10 Edition are not supported by this script.
pause > nul

:setRegistry
echo Set Windows 10 free upgrade stuff
reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%scriptPath%bin\gatherosstate.exe" /d "^ WIN7RTM" /f
echo.
goto generateTicket

:generateTicket
echo Generate ticket
%scriptPath%bin\gatherosstate.exe
echo GenuineTicket.xml generated.
goto cleaningRegistry

:cleaningRegistry
echo.
echo Cleaning registry
reg delete "HKLM\SYSTEM\Tokens" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%scriptPath%bin\gatherosstate.exe" /f
goto convertTicket

:convertTicket
echo.
echo Converting Windows digital license from ticket
clipup -v -o -altto %scriptPath%bin\
goto doActivate

:doActivate
echo.
echo Activating Windows 10
cscript /nologo %windir%\system32\slmgr.vbs -ato

cscript /nologo %windir%\system32\slmgr.vbs -dli | find "Licensed" > nul
if %errorlevel% == 0 ( goto Activated ) else ( goto NotActivated )

:Activated
echo Windows is activated.
goto credits

:NotActivated
echo Windows is not activated.
echo Please check your internet connection or Windows Edition are not supported.
goto credits

:credits
echo.
echo Credits:
echo This batch script based from few tutorials on internet.
echo This script includes 32bit gatherosstate.exe from Microsoft Windows 10 1803 iso.
echo slshim 32bit dynamic link library from https://github.com/vyvojar/slshim/
echo If you see any Access Denied. or failed to activate, make sure you run this script with Administrative Rights.
pause > nul
