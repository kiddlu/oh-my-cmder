@echo on
if not defined ADB set ADB=adb
if not defined VLC set VLC="C:\Program Files\VideoLAN\VLC\vlc.exe"
if not defined SNDCPY_APK set SNDCPY_APK=sndcpy.apk
if not defined SNDCPY_PORT set SNDCPY_PORT=28200

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%
set timetag=%ldt%%time:~0,2%%time:~3,2%%time:~6,2%

if not "%1"=="" (
    set serial=-s %1
    echo Waiting for device %1...
) else (
    echo Waiting for device...
)

%ADB% %serial% wait-for-device || goto :error
::%ADB% %serial% install -t -r -g %SNDCPY_APK% || (
::    echo Uninstalling existing version first...
::    %ADB% %serial% uninstall com.rom1v.sndcpy || goto :error
::    %ADB% %serial% install -t -g %SNDCPY_APK% || goto :error
::)
%ADB% %serial% forward tcp:%SNDCPY_PORT% localabstract:sndcpy || goto :error
::%ADB% %serial% shell am start com.rom1v.sndcpy/.MainActivity || goto :error
echo Press Enter once audio capture is authorized on the device to start playing...
pause >nul
echo Playing audio...
::%VLC% --demux rawaud --network-caching=50 tcp://localhost:%SNDCPY_PORT% --sout "#transcode{acodec=s16l,channels=2,samplerate=48000}:duplicate{dst=std{access=file,mux=wav,dst=record_%timetag%.wav},dst=display}" vlc://quit
%VLC% --demux rawaud --network-caching=50 tcp://localhost:%SNDCPY_PORT% --sout "#transcode{acodec=flac}:duplicate{dst=std{access=file,mux=raw,dst=record_%timetag%.flac},dst=display}" vlc://quit
goto :EOF

:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%
