@echo off
rem AI Batch Translator - launcher (no console window)
cd /d "%~dp0"
where pythonw >nul 2>nul
if %errorlevel%==0 (
    start "" pythonw main.py
) else (
    start "" python main.py
)