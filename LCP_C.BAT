@echo off
chcp 1251 >nul
setlocal EnableDelayedExpansion

title LCP STARTER C Compiler v9.1

echo ==========================================
echo    LCP STARTER C - COMPILER v9.1
echo    (c) LCP CORPORATION
echo ==========================================
echo.

set "PD=%~dp0"
set "NASM=%PD%NASM\nasm.exe"
set "GOLINK=%PD%GoLink\GoLink.exe"

if not exist "%NASM%" ( echo NASM not found & pause & exit /b )
if not exist "%PD%LCP_STARTER.ASM" ( echo LCP_STARTER.ASM not found & pause & exit /b )
if not exist "%PD%LCP_STARTER_C.ASM" ( echo LCP_STARTER_C.ASM not found & pause & exit /b )

set "INFILE=%~1"
if "%INFILE%"=="" for %%f in (*.lc) do set "INFILE=%%f"
if not exist "%INFILE%" ( echo No .LC file & pause & exit /b )

for %%f in ("%INFILE%") do set "NAME=%%~nf"

set "PLATFORM=%~2"
if "%PLATFORM%"=="" (
    echo 1=x86 2=x64
    set /p "CH=Choice: "
    if "!CH!"=="1" set "PLATFORM=x86"
    if "!CH!"=="2" set "PLATFORM=x64"
    if "!PLATFORM!"=="" set "PLATFORM=x86"
)

set "EXE=%NAME%.exe"
set "ASM=%NAME%.asm"
set "OBJ=%NAME%.obj"

if "!PLATFORM!"=="x86" ( set "NFMT=win32" & set "ENTRY=_main" )
if "!PLATFORM!"=="x64" ( set "NFMT=win64" & set "ENTRY=main" )

echo.
echo Source: %INFILE%
echo Platform: %PLATFORM%
echo Output: %EXE%
echo.

echo [1/3] Translating...

> "%ASM%" (
    echo %%include "LCP_STARTER.ASM"
    echo %%include "LCP_STARTER_C.ASM"
    echo ÈÌÏÎÐÒ
    echo ÑÅÊÖÈß_ÄÀÍÍÛÕ
    
    for /f "usebackq tokens=* delims=" %%a in ("%INFILE%") do (
        set "L=%%a"
        set "W1=!L:~0,17!"
        if "!W1!"=="ñòðîêà_îïðåäåëèòü" (
            set "REST=!L:~18!"
            for /f "tokens=1,* delims==" %%b in ("!REST!") do (
                set "V=%%b"
                set "S=%%c"
                set "V=!V: =!"
                set "S=!S:"=!"
                echo !V!: db "!S!", 0
                echo !V!_len equ $ - !V! - 1
            )
        )
    )
    
    echo ÑÅÊÖÈß_BSS
    echo _keybuf: resb 1
    echo ÑÅÊÖÈß_ÊÎÄÀ
    echo ÃËÀÂÍÀß
    
    for /f "usebackq tokens=* delims=" %%a in ("%INFILE%") do (
        set "L=%%a"
        set "W1=!L:~0,17!"
        if not "!W1!"=="ñòðîêà_îïðåäåëèòü" (
            if "!L!"=="" ( echo. ) else (
                set "O=!L!"
                set "O=!O:ôóíêöèÿ main=; main entry!"
                set "O=!O:ôóíêöèÿ =ÔÓÍÊÖÈß !"
                set "O=!O:êîíåö_ôóíêöèè=ÊÎÍÅÖ_ÔÓÍÊÖÈÈ!"
                set "O=!O:íàïå÷àòàòü =ÍÀÏÅ×ÀÒÀÒÜ !"
                set "O=!O:çàâåðøèòü=ÇÀÂÅÐØÈÒÜ!"
                echo !O!
            )
        )
    )
    
    echo ÊÎÍÅÖ_ÃËÀÂÍÎÉ
)

echo [2/3] NASM...
"%NASM%" -f %NFMT% "%ASM%" -o "%OBJ%" -i "%PD%" 2>_e.txt
if errorlevel 1 ( type _e.txt & del _e.txt 2>nul & pause & exit /b )
del _e.txt 2>nul

echo [3/3] GoLink...
if exist "%GOLINK%" (
    "%GOLINK%" /entry:%ENTRY% /console "%OBJ%" kernel32.dll msvcrt.dll /fo "%EXE%" 2>_e.txt
    if exist "%EXE%" (
        del _e.txt 2>nul & del "%OBJ%" 2>nul
        echo.
        echo ==========================================
        echo   SUCCESS! %EXE% (%PLATFORM%)
        for %%a in ("%EXE%") do echo   Size: %%~za bytes
        echo ==========================================
        pause
        exit /b
    )
    echo GoLink error:
    type _e.txt
    del _e.txt 2>nul
    pause
    exit /b
)

echo GoLink not found: %GOLINK%
echo Download from http://www.godevtool.com/
pause
exit /b