@ECHO OFF
:relaunchLoop

rem =================================MODIFY===========================================
rem Modify the following variables when installing on a new machine
rem Space character is sensitive for the variable definition!
set stopAgentScriptPath="C:\ReleaseBuilds\BatchFiles\AgentScripts\agentsStop.bat"
set startAgentScriptPath="C:\ReleaseBuilds\BatchFiles\AgentScripts\agentsStart.bat"
rem stun server script path does NOT have quotes
set stunServerScriptPath=C:\FactualVR\Server\WebRTC\stuntman\stunserver.exe 
set signalServerPath="C:\FactualVR\Server\WebRTC\awrtc_signaling"
set nodeDSSPath="C:\FactualVR\Server\WebRTC\NodeDSS"
rem relaunch timeout is in seconds. 24 hours = 86400 seconds
set relaunchTimeout=5
set timeoutBetweenStopAndStart=5
rem ==================================================================================

echo =============================Relaunch Start=====================================
echo Stopping Core Server Components
rem if exist "C:\FactualVR\Server\servicestop.bat" (call "C:\FactualVR\Server\servicestop.bat")
rem stop agents
@REM if exist %stopAgentScriptPath% (powershell "" -executionPolicy bypass -file %stopAgentScriptPath%)
if exist %stopAgentScriptPath% (call %stopAgentScriptPath%)

echo Stopping Video Stream Servers
rem stop applications named "stunserver.exe"
taskkill /f /im stunserver.exe
rem The following command will stop all processes named "npm"
taskkill /FI "WindowTitle eq npm*" /T /F

timeout /t %timeoutBetweenStopAndStart% /nobreak

echo Starting Core Server Components
rem if exist "C:\FactualVR\Server\servicestart.bat" (call "C:\FactualVR\Server\servicestart.bat")
@REM if exist "C:\FactualVR\Server\iisftp\scripts\start.ps1" (powershell "" -executionPolicy bypass -windowstyle hidden -file "C:\FactualVR\Server\iisftp\scripts\start.ps1")
@REM if exist %startAgentScriptPath% (powershell "" -executionPolicy bypass -file %startAgentScriptPath%)
if exist %startAgentScriptPath% (call %startAgentScriptPath%)

echo Starting Video Stream Servers
if exist "%stunServerScriptPath%" (start "stunserver.exe" %stunServerScriptPath%)
if exist %signalServerPath% (
    cd %signalServerPath%
    start "" npm start
)
if exist %nodeDSSPath% (
    cd %nodeDSSPath%
    start "" npm start
)

For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set currentTime=%%a%%b)
echo Server Launch Complete at %currentTime%. Wait for %relaunchTimeout% seconds till server relaunch.
echo =============================Relaunch End=====================================
timeout /t %relaunchTimeout% /nobreak

goto relaunchLoop