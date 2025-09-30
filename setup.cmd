@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo Wokwi Tool Installation Script
echo ==========================================
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges...
) else (
    echo This script requires administrator privileges.
    echo Please run as administrator.
    pause
    exit /b 1
)

:: Set installation directory
set "INSTALL_DIR=%ProgramFiles%\WokwiTool"
set "CURRENT_DIR=%~dp0"

echo Current directory: %CURRENT_DIR%
echo Installation directory: %INSTALL_DIR%
echo.

:: Create installation directory
echo Creating installation directory...
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
    if !errorLevel! neq 0 (
        echo Failed to create installation directory.
        pause
        exit /b 1
    )
    echo Installation directory created successfully.
) else (
    echo Installation directory already exists.
)
echo.

:: Copy files to installation directory
echo Copying files to installation directory...
xcopy /E /I /H /Y "%CURRENT_DIR%*" "%INSTALL_DIR%"
if %errorLevel% neq 0 (
    echo Failed to copy files.
    pause
    exit /b 1
)
echo Files copied successfully.
echo.

:: Add to PATH environment variable
echo Adding Wokwi to system PATH...
set "NEW_PATH=%INSTALL_DIR%"

:: Get current PATH
for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH 2^>nul') do set "CURRENT_PATH=%%B"

:: Check if path already exists
echo %CURRENT_PATH% | findstr /C:"%NEW_PATH%" >nul
if %errorLevel% == 0 (
    echo Wokwi path already exists in system PATH.
) else (
    :: Add new path to existing PATH
    set "UPDATED_PATH=%CURRENT_PATH%;%NEW_PATH%"
    
    :: Update registry
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_EXPAND_SZ /d "!UPDATED_PATH!" /f >nul
    if !errorLevel! == 0 (
        echo Wokwi path added to system PATH successfully.
        echo You may need to restart your command prompt or system for changes to take effect.
    ) else (
        echo Failed to add Wokwi path to system PATH.
        pause
        exit /b 1
    )
)
echo.

:: Broadcast environment change
echo Broadcasting environment variable changes...
powershell -Command "& {[System.Environment]::SetEnvironmentVariable('PATH', [System.Environment]::GetEnvironmentVariable('PATH', 'Machine'), 'Machine')}"

echo.
echo ==========================================
echo Installation completed successfully!
echo ==========================================
echo.
echo Installation location: %INSTALL_DIR%
echo Wokwi executable: %INSTALL_DIR%\wokwi.exe
echo.
echo You can now use 'wokwi' command from any command prompt.
echo Note: You may need to restart your command prompt for PATH changes to take effect.
echo.
pause