echo "BUILD"
pushd %cd%
call vcvarsall.bat amd64
popd

rmdir "bin" /S /Q
rmdir "build" /S /Q 

if not exist "build" mkdir "build"
cd build

rem call vcvarsall.bat amd64

qmake -makefile -o Makefile ../SignUpForm.pro -spec win32-msvc

jom
cd ../
echo "DEPLOY"

if not exist "bin" mkdir "bin"
windeployqt --qmldir src build/release/SignUpForm.exe --dir "bin" --release --force
xcopy /Y build\release\SignUpForm.exe "bin"
xcopy /Y build\countries.xml "bin"
echo "build finished"