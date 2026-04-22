@echo off
REM Download and extract the MovieLens ml-latest-small dataset for Windows

SET DATA_URL=https://files.grouplens.org/datasets/movielens/ml-latest-small.zip
SET DATA_ZIP=ml-latest-small.zip
SET DATA_DIR=ml-latest-small

IF EXIST %DATA_DIR% (
    echo Directory %DATA_DIR% already exists. Remove it if you want to re-download.
    exit /b 0
)

REM Check for curl or wget
where curl >nul 2>nul
IF %ERRORLEVEL%==0 (
    curl -L %DATA_URL% -o %DATA_ZIP%
) ELSE (
    where wget >nul 2>nul
    IF %ERRORLEVEL%==0 (
        wget %DATA_URL% -O %DATA_ZIP%
    ) ELSE (
        echo Neither curl nor wget found. Please install one and try again.
        exit /b 1
    )
)

REM Check for tar or PowerShell's Expand-Archive
where tar >nul 2>nul
IF %ERRORLEVEL%==0 (
    tar -xf %DATA_ZIP%
) ELSE (
    powershell -Command "Expand-Archive -Path '%DATA_ZIP%' -DestinationPath '.'"
    IF %ERRORLEVEL% NEQ 0 (
        echo Neither tar nor PowerShell's Expand-Archive could extract the zip. Please extract manually.
        exit /b 1
    )
)

del %DATA_ZIP%
echo MovieLens dataset downloaded and extracted to %DATA_DIR%\
