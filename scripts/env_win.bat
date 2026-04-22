@echo off
REM Create and activate a Python virtual environment for the project (Windows)

REM Check for Python
where python >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed or not in PATH. Please install Python 3 and try again.
    exit /b 1
)

REM Create venv if it doesn't exist
IF NOT EXIST venv (
    python -m venv venv
)

REM Activate the virtual environment
call venv\Scripts\activate.bat

REM Show Python version and pip location
python --version
where pip

echo Virtual environment activated. To deactivate, type: deactivate
