REM Copy python dependencies
if not exist %PREFIX%\Lib mkdir %PREFIX%\Lib || exit /b 1
xcopy %SRC_DIR%\extracted\opt\deadline-cloud-for-keyshot %PREFIX%\Lib /s /e || exit /b 1

REM Copy scripts.
if not exist %SCRIPTS% mkdir %SCRIPTS% || exit /b 1
copy %RECIPE_DIR%\KeyShotAdaptor.bat %SCRIPTS%\KeyShotAdaptor.bat || exit /b 1
copy %RECIPE_DIR%\keyshot-openjd-script.py %SCRIPTS%\keyshot-openjd-script.py || exit /b 1

if not exist "%PREFIX%\etc\conda\activate.d\" mkdir "%PREFIX%\etc\conda\activate.d" || exit /b 1
if not exist "%PREFIX%\etc\conda\deactivate.d\" mkdir "%PREFIX%\etc\conda\deactivate.d" || exit /b 1
copy %RECIPE_DIR%\activate.sh "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1
copy %RECIPE_DIR%\activate.bat "%PREFIX%\etc\conda\activate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
copy %RECIPE_DIR%\deactivate.sh "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.sh" || exit /b 1
copy %RECIPE_DIR%\deactivate.bat "%PREFIX%\etc\conda\deactivate.d\%PKG_NAME%-%PKG_VERSION%-vars.bat" || exit /b 1
