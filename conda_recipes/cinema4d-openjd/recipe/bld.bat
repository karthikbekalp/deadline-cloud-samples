python -m pip install . -vv --no-deps --no-build-isolation 

REM See https://docs.conda.io/projects/conda/en/latest/dev-guide/deep-dives/activation.html
REM for details on activation. The Deadline Cloud sample queue environments use bash
REM to activate environments on Windows, so we recommend always producing both .bat and .sh files.

if not exist "%PREFIX%\etc\conda\activate.d\" mkdir "%PREFIX%\etc\conda\activate.d" || exit /b 1
if not exist "%PREFIX%\etc\conda\deactivate.d\" mkdir "%PREFIX%\etc\conda\deactivate.d" || exit /b 1
copy %RECIPE_DIR%\activate.sh "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1
copy %RECIPE_DIR%\activate.bat "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
copy %RECIPE_DIR%\deactivate.sh "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1
copy %RECIPE_DIR%\deactivate.bat "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
