@cd/d"%~dp0"&(cacls "%SystemDrive%\System Volume Information" >nul 2>nul)||(start "" mshta vbscript:CreateObject^("Shell.Application"^).ShellExecute^("%~nx0"," %*","","runas",1^)^(window.close^)&exit /b)


@echo off
echo Windows thinks it is needed to REBOOT to make such a small change !!! 
echo THAT'S NOT COOL ,Microsoft !
echo So are you willing to pay the price for deactivating/activating your default laptop keyboard for now ? [y/n]
set /p choice=

IF %choice% == y  (
    echo Here we go!
) ELSE (
    IF %choice% == Y  (
        echo Here we go!
    ) ELSE (
        echo Bye~ Hope those genius from Microsoft will fix this some day!
        GOTO :EOF
    )
)

set /p str1=<./indicator.txt
%An indicator will be stored in the indicator.txt, which tells the script whether Keyboard was baned.%
%Yes, it is the lazy way, but it works well.%

IF %str1% == 0 (
    sc config i8042prt start= demand 
    %activating your default laptop keyboard%
    echo Activated
    echo 1 > indicator.txt
) ELSE (
    sc config i8042prt start= disabled 
    %deactivating your default laptop keyboard%
    echo Deactivated
    echo 0 > indicator.txt
)

shutdown -r -t 0