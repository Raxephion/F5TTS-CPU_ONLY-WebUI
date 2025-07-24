@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Get current directory
set "CURRENT_DIR=%cd%"

echo.
echo [*] Launching F5-TTS Gradio App from:
echo     %CURRENT_DIR%
echo.

REM Step 1: Activate Conda environment
call conda activate F5-TTS-CPU_ONLY

REM Step 2: Navigate to current directory
cd /d "%CURRENT_DIR%"

REM Step 3: Launch Gradio app
f5-tts_infer-gradio

echo.
echo [✓] App has exited.
pause
