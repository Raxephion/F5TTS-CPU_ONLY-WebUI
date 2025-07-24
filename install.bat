@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo.
echo [*] Starting F5-TTS CPU-Only Setup...
echo.

REM Step 1: Create Conda Environment
echo [*] Creating conda environment: F5-TTS-CPU_ONLY
call conda create -n F5-TTS-CPU_ONLY python=3.10 -y

REM Step 2: Activate Environment
echo [*] Activating environment...
call conda activate F5-TTS-CPU_ONLY

REM Step 3: Navigate to folder
echo [*] Changing directory to C:\F5-TTS-CPU_ONLY
cd /d C:\F5-TTS-CPU_ONLY

REM Step 4: Install package in editable mode
echo [*] Installing package in editable mode...
pip install -e .

echo.
echo [✓] Installation complete!
echo [*] To activate the environment in the future, run:
echo     conda activate F5-TTS-CPU_ONLY
echo.
pause
