@echo off
chcp 1251 >nul
title LCP STARTER C - FULL BUILD v7.0

echo ==========================================
echo    LCP STARTER C - FULL BUILD v7.0
echo    (c) LCP CORPORATION
echo ==========================================
echo.

set "PD=%~dp0"

if not exist "%PD%LCP_STARTER.ASM" ( echo LCP_STARTER.ASM missing! & pause & exit /b )
if not exist "%PD%LCP_STARTER_C.ASM" ( echo LCP_STARTER_C.ASM missing! & pause & exit /b )
if not exist "%PD%NASM\nasm.exe" ( echo NASM missing! & pause & exit /b )

echo All files found.
echo.

echo Select platform for ALL:
echo   1 = x86 (32-bit)
echo   2 = x64 (64-bit)
echo   3 = Both
echo.
set /p "PCH=Choice: "
if "%PCH%"=="" set "PCH=1"

for %%f in (*.lc) do (
    echo ========================================
    echo Compiling: %%f
    echo ========================================
    
    set "ORIG=%%f"
    set "SAFE=%%~nf"
    
    :: If Russian letters in filename, copy to temp
    echo !SAFE! | findstr /r "[à-ÿÀ-ß]" >nul
    if !errorlevel!==0 (
        set "TEMPNAME=_temp_!RANDOM!.lc"
        copy "%%f" "!TEMPNAME!" >nul
        if "%PCH%"=="3" (
            call "%PD%LCP_C.BAT" "!TEMPNAME!" x86
            call "%PD%LCP_C.BAT" "!TEMPNAME!" x64
        ) else if "%PCH%"=="2" (
            call "%PD%LCP_C.BAT" "!TEMPNAME!" x64
        ) else (
            call "%PD%LCP_C.BAT" "!TEMPNAME!" x86
        )
        :: Rename output back to original name
        for %%e in ("!SAFE!_x86.exe" "!SAFE!_x64.exe" "!SAFE!.exe") do (
            if exist "_temp_%%~ne.exe" (
                ren "_temp_%%~ne.exe" "!SAFE!%%~xe" 2>nul
            )
        )
        del "!TEMPNAME!" 2>nul
    ) else (
        if "%PCH%"=="3" (
            call "%PD%LCP_C.BAT" "%%f" x86
            call "%PD%LCP_C.BAT" "%%f" x64
        ) else if "%PCH%"=="2" (
            call "%PD%LCP_C.BAT" "%%f" x64
        ) else (
            call "%PD%LCP_C.BAT" "%%f" x86
        )
    )
    echo.
)

echo ==========================================
echo   BUILD COMPLETE
echo ==========================================
dir /b *.exe 2>nul
echo.
pause
pause
pause
pause