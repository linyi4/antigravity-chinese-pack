@echo off
setlocal
chcp 65001 >nul
title Antigravity Chinese Pack - Restore English

set "HERE=%~dp0"
set "INSP="

for %%P in ("%LOCALAPPDATA%\Programs\antigravity" "%LOCALAPPDATA%\Programs\Antigravity" "%ProgramFiles%\Antigravity" "%ProgramFiles(x86)%\Antigravity") do (
  if not defined INSP if exist "%%~P\Antigravity.exe" set "INSP=%%~P"
)

if not defined INSP (
  for /f "usebackq delims=" %%R in (`powershell -NoProfile -Command "(Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like '*Antigravity*' } | Select-Object -First 1).InstallLocation"`) do set "INSP=%%R"
)

if not defined INSP (
  echo [ERROR] Antigravity not found. Install it first, then run this again.
  pause
  exit /b 1
)

echo Install dir: %INSP%
echo.
echo Step 1/3  closing Antigravity...
taskkill /f /im Antigravity.exe /t >nul 2>nul
timeout /t 3 >nul

echo Step 2/3  restoring official English files...
set "ELECTRON_RUN_AS_NODE=1"
"%INSP%\Antigravity.exe" "%HERE%localization_engine.js" --install-dir "%INSP%" --huifu
set "RC=%ERRORLEVEL%"
set "ELECTRON_RUN_AS_NODE="

if not "%RC%"=="0" (
  echo.
  echo [ERROR] Restore failed. Code: %RC%
  pause
  exit /b %RC%
)

echo.
echo Step 3/3  starting Antigravity...
start "" "%INSP%\Antigravity.exe"
timeout /t 3 >nul
exit /b 0
