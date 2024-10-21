REM The version without the build number
FOR /F "tokens=1,2 delims=." %%A IN ("%PKG_VERSION%") DO set C4D_VERSION="%%A.%%B"

if not exist "%PREFIX%\c4d\" mkdir "%PREFIX%\c4d" || exit /b 1
start /wait /b cmd /c "%SRC_DIR%\installer\Cinema4D_2025_%PKG_VERSION%.2_Win.exe --mode unattended --unattendedmodeui none --prefix %PREFIX%\c4d\" || exit /b 1


if not exist "%PREFIX%\etc\conda\activate.d\" mkdir "%PREFIX%\etc\conda\activate.d" || exit /b 1
if not exist "%PREFIX%\etc\conda\deactivate.d\" mkdir "%PREFIX%\etc\conda\deactivate.d" || exit /b 1

(
    echo set C4D_LOCATION="%%CONDA_PREFIX%%\c4d"
    echo set DEADLINE_CINEMA4D_EXE="%%CONDA_PREFIX%%\c4d\Commandline.bat"
    echo set C4D_VERSION=%C4D_VERSION%
) > "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1

(
    echo set C4D_LOCATION=
    echo set C4D_VERSION=
    echo set DEADLINE_CINEMA4D_EXE=
) > "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
