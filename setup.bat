@echo off
setlocal

REM ===========================================================================
REM  DataFolderSelectorDemo - one-time setup
REM
REM  The libraries this workspace needs are NOT stored in this repository (see
REM  .gitignore). This script provides them, and it behaves differently by
REM  machine so that one arrangement serves both maintainer and user:
REM
REM    * If a shared RDC library pool sits next to this workspace (a sibling
REM      ..\Libraries folder carrying the marker file .rdc-library-pool), it
REM      makes Libraries\ a JUNCTION to that pool. One shared, editable copy:
REM      a fix made here is a fix in the pool, and every workspace linked to
REM      the pool has it at once - nothing to propagate.
REM
REM    * Otherwise it CLONES the library into this workspace's own Libraries\
REM      folder - isolated, self-contained, and it never writes anywhere
REM      outside this workspace, so it cannot disturb libraries you already
REM      have elsewhere.
REM
REM  Re-run any time Libraries\ looks missing or out of date.
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

if exist "..\Libraries\.rdc-library-pool" (
    REM ------------------------------------------------------------------ pool
    if exist "Libraries" (
        echo Libraries\ already present - assuming it is linked. Skipping.
    ) else (
        echo Shared library pool found next door - linking Libraries\ to it...
        mklink /J "Libraries" "..\Libraries" >nul
        if errorlevel 1 (
            echo.
            echo [ERROR] Could not create the junction to ..\Libraries.
            echo         Create it by hand with:
            echo             mklink /J "%CD%\Libraries" "%CD%\..\Libraries"
            echo.
            pause
            exit /b 1
        )
        echo Linked: Libraries  -^>  ..\Libraries
    )
) else (
    REM --------------------------------------------------------------- isolated
    REM No shared pool. Clone the FLAT dependency set into this workspace's own
    REM Libraries\ - DataFolderSelector plus the three it references as siblings
    REM (..\DFAbout, ..\RDCToolsLib, ..\vwin32fh). DataFolderSelector no longer
    REM nests them, so they must be cloned alongside it, not recursively inside.
    REM This never writes outside this workspace.
    for %%N in (DataFolderSelector DFAbout RDCToolsLib vwin32fh) do (
        if not exist "Libraries\%%N\.git" (
            echo Cloning %%N into Libraries\ ...
            git clone https://github.com/NilsSve/Library-%%N.git "Libraries\%%N"
            if errorlevel 1 (
                echo.
                echo [ERROR] Could not clone Library-%%N.
                echo         Check your connection and that you can reach:
                echo           https://github.com/NilsSve/Library-%%N.git
                echo.
                pause
                exit /b 1
            )
        ) else (
            echo Updating Libraries\%%N ...
            git -C "Libraries\%%N" pull --ff-only
        )
    )
)

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
echo Libraries\ is ready. Open a DataFolderSelectorDemo*.sws in the Studio and
echo build. If Libraries\ is a junction to the shared pool, editing a library
echo file here edits the pool - there is no separate copy to drift.
echo.
pause
exit /b 0
