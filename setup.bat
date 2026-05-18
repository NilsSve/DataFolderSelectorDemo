@echo off
setlocal

REM ===========================================================================
REM  DataFolderSelectorDemo - one-time setup
REM
REM  Run this once after cloning (and any time the Libraries\ folders look
REM  empty or out of date, or a submodule has changed). It:
REM    1. Downloads / updates the library submodule (DataFolderSelector) to
REM       the exact version this workspace expects.
REM    2. Configures THIS clone so a normal "git pull" keeps that library
REM       in sync automatically from then on.
REM
REM  Nothing here is destructive: it only fetches the library and sets one
REM  local git option for this repository.
REM ===========================================================================

cd /d "%~dp0"

echo.
echo === DataFolderSelectorDemo setup ===
echo Working folder: %CD%
echo.

where git >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Git was not found on your PATH.
    echo         Install Git ^(or the GitHub Desktop app^), reopen the
    echo         command prompt, and run setup.bat again.
    echo.
    pause
    exit /b 1
)

git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 (
    echo [ERROR] This folder is not a git repository.
    echo         Clone DataFolderSelectorDemo with GitHub Desktop or
    echo         "git clone", then run setup.bat from the repository root.
    echo.
    pause
    exit /b 1
)

echo Synchronizing submodule definitions...
git submodule sync --recursive

echo.
echo Downloading / updating the library submodule ^(this may take a minute^)...
git submodule update --init --recursive
if errorlevel 1 (
    echo.
    echo [ERROR] The submodule could not be fetched.
    echo         Check your internet connection and that you can reach:
    echo           - https://github.com/NilsSve/Library-DataFolderSelector.git
    echo         Then run setup.bat again.
    echo.
    pause
    exit /b 1
)

echo.
echo Configuring this clone to keep the library in sync on every "git pull"...
git config submodule.recurse true

echo.
if exist "%~dp0skip-local-data.cmd" (
    echo Protecting your local Data\ database from accidental commits...
    call "%~dp0skip-local-data.cmd"
) else (
    echo [NOTE] skip-local-data.cmd not found - skipping local DB protection.
)

echo.
echo === Setup complete ===
echo.
echo The Libraries\ folder now holds DataFolderSelector at the version this
echo workspace expects. From now on a normal "git pull" (or Pull in GitHub
echo Desktop) will also update it automatically.
echo.
echo If a brand-new library/submodule is ever added, just run setup.bat once
echo more to pick it up.
echo.
pause
exit /b 0
