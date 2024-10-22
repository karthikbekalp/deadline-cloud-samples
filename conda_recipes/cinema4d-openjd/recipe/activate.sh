export C4D_LOCATION="$CONDA_PREFIX\\c4d"
export C4D_VERSION="%PKG_VERSION%"
export DEADLINE_CLOUD_PYTHONPATH="%SP_DIR%"
export DEADLINE_CINEMA4D_EXE="$CONDA_PREFIX\\c4d\\Commandline.exe"
export redshift_LICENSE=5054@127.0.0.1
export g_licenseServerUrl=http://127.0.0.1:5236
$CONDA_PREFIX\\c4d\\resource\\modules\\python\\libs\\win64\\python.exe -m ensurepip
$CONDA_PREFIX\\c4d\\resource\\modules\\python\\libs\\win64\\python.exe -m pip install pywin32