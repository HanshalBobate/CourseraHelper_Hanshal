@echo off
title AI Clipboard Server Setup

echo Copying server.py from erqerwerwer.py...
copy /Y "%~dp0erqerwerwer.py" "%~dp0server.py" >nul

if errorlevel 1 (
    echo ERROR: Could not copy erqerwerwer.py to server.py. Make sure both files are in the same folder.
    pause
    exit /b 1
)

echo server.py created successfully.

echo.
echo Starting Ollama server...
start cmd /k ollama serve

timeout /t 3 >nul

echo Starting model...
start cmd /k ollama run gpt-oss:150b

echo.
echo Starting Flask server...
start cmd /k python "%~dp0server.py"

echo.
echo DONE. System ready bhidu!
pause
