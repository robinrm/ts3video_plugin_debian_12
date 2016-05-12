@echo off
call "%VS140COMNTOOLS%\..\..\Vc\vcvarsall.bat" x64

rem Build specific settings
set OCS_BUILD_DIR_NAME=build-win-x86-64

rem Setup Qt
set QTDIR=%OCS_QTDIR_X86_64%
set QT_QPA_PLATFORM_PLUGIN_PATH=%QTDIR%\plugins
set PATH=%QTDIR%\bin;%PATH%

call "env-win-all.bat"