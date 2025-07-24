@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo.
echo [*] Launching F5-TTS Gradio App...
echo.

REM Step 1: Activate Conda environment
call conda activate F5-TTS-CPU_ONLY

REM Step 2: Navigate to project directory
cd /d C:\F5-TTS-CPU_ONLY

REM Step 3: Launch Gradio app
f5-tts_infer-gradio

echo.
echo [✓] App has exited.
pause
