@echo off
rem ============================================================
rem  MK Vox Studio - portable double-click launcher
rem  Starts the studio on localhost and opens it in an app window.
rem  No install, no setup, no terminal commands needed.
rem ============================================================
cd /d "%~dp0"

set "APP=%~dp0app\launch_desktop_app.py"
if not exist "%APP%" set "APP=%~dp0launch_desktop_app.py"

if exist "%~dp0runtime\pythonw.exe" (
  start "" "%~dp0runtime\pythonw.exe" "%APP%"
  exit /b 0
)
if exist "%~dp0runtime\python.exe" (
  "%~dp0runtime\python.exe" "%APP%"
  exit /b 0
)
where py >nul 2>nul
if not errorlevel 1 (
  py -3 "%APP%"
  exit /b 0
)
python "%APP%"
