@echo off
rem ============================================================
rem  MK Vox Studio - portable double-click launcher (v1.0.1)
rem  Console launcher: agar app start na ho to error isi window
rem  me rukega aur startup-log.txt me bhi save hoga - silent
rem  fail wala purana pythonw tareeka hata diya gaya hai.
rem ============================================================
cd /d "%~dp0"

set "APP=%~dp0app\launch_desktop_app.py"
if not exist "%APP%" set "APP=%~dp0launch_desktop_app.py"

if exist "%~dp0runtime\python.exe" (
  "%~dp0runtime\python.exe" "%APP%"
  if errorlevel 1 goto :error
  exit /b 0
)
where py >nul 2>nul
if not errorlevel 1 (
  py -3 "%APP%"
  if errorlevel 1 goto :error
  exit /b 0
)
python "%APP%"
if errorlevel 1 goto :error
exit /b 0

:error
echo.
echo ============================================================
echo  MK Vox Studio start nahi ho saka.
echo  Upar screen par jo error dikh raha hai, uska photo le kar
echo  bhej do - ya isi folder ki startup-log.txt file bhej do.
echo ============================================================
pause
exit /b 1
