REM The version without the build number
FOR /F "tokens=1,2 delims=." %%A IN ("%PKG_VERSION%") DO set C4D_VERSION="%%A.%%B"

if not exist "%PREFIX%\c4d\" mkdir "%PREFIX%\c4d" || exit /b 1
start /wait /b cmd /c "%SRC_DIR%\installer\Cinema4D_2025_%PKG_VERSION%_Win.exe --mode unattended --unattendedmodeui none --prefix %PREFIX%\c4d\" || exit /b 1

REM Symlinks on Windows require Admin privileges to create. So create batch files in the PATH instead.
if not exist "%SCRIPTS%\" mkdir "%SCRIPTS%" || exit /b 1
(
    echo start /wait /b cmd /c %%CONDA_PREFIX%%\c4d\"Cinema 4D.exe" %%*
) > "%SCRIPTS%\Cinema 4D.bat"

(
    echo start /wait /b cmd /c %%CONDA_PREFIX%%\c4d\Commandline.exe %%*
) > "%SCRIPTS%\Commandline.bat"


if not exist "%PREFIX%\etc\conda\activate.d\" mkdir "%PREFIX%\etc\conda\activate.d" || exit /b 1
if not exist "%PREFIX%\etc\conda\deactivate.d\" mkdir "%PREFIX%\etc\conda\deactivate.d" || exit /b 1

REM See https://docs.conda.io/projects/conda/en/latest/dev-guide/deep-dives/activation.html
REM for details on activation. The Deadline Cloud sample queue environments use bash
REM to activate environments on Windows, so we recommend always producing both .bat and .sh files.

(
    echo set C4D_LOCATION="%%CONDA_PREFIX%%\c4d"
    echo set C4D_VERSION="%PKG_VERSION%"
    echo set DEADLINE_CLOUD_PYTHONPATH="%SP_DIR%"
    echo set DEADLINE_CINEMA4D_EXE="%CONDA_PREFIX%\c4d\Commandline.exe"
    echo set redshift_LICENSE=5054@127.0.0.1
    echo set g_licenseServerUrl=http://127.0.0.1:5236
) > "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
(
    echo export C4D_LOCATION="$CONDA_PREFIX\\c4d"
    echo export C4D_VERSION="%PKG_VERSION%"
    echo export DEADLINE_CLOUD_PYTHONPATH="%SP_DIR%"
    echo export DEADLINE_CINEMA4D_EXE="$CONDA_PREFIX\\c4d\\Commandline.exe"
    echo export redshift_LICENSE=5054@127.0.0.1
    echo export g_licenseServerUrl=http://127.0.0.1:5236
) > "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1

(
    echo set C4D_LOCATION=
    echo set C4D_VERSION=
    echo set DEADLINE_CLOUD_PYTHONPATH=
    echo set DEADLINE_CINEMA4D_EXE=
    echo set redshift_LICENSE=
    echo set g_licenseServerUrl=
) > "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
(
    echo unset C4D_LOCATION
    echo unset C4D_VERSION
    echo unset DEADLINE_CLOUD_PYTHONPATH
    echo unset DEADLINE_CINEMA4D_EXE
    echo unset redshift_LICENSE
    echo unset g_licenseServerUrl
) > "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1
