set C4D_LOCATION="%%CONDA_PREFIX%%\c4d"
set C4D_VERSION="%PKG_VERSION%"
set DEADLINE_CLOUD_PYTHONPATH="%SP_DIR%"
set DEADLINE_CINEMA4D_EXE="%CONDA_PREFIX%\c4d\Commandline.exe"
set redshift_LICENSE=5054@127.0.0.1
set g_licenseServerUrl=http://127.0.0.1:5236
%%CONDA_PREFIX%%\c4d\resource\modules\python\libs\win64\python.exe -m ensurepip
%%CONDA_PREFIX%%\c4d\resource\modules\python\libs\win64\python.exe -m pip install pywin32