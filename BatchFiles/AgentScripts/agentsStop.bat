@ECHO OFF
rem =================================MODIFY===========================================
rem agentWorkingDirectoryPath = "C:\FactualVR\Server\agents\"
set agentWorkingDirectoryPath="C:\ReleaseBuilds"
set ApexImageAgent="ApexImageProcessAgent"
set ThreeDAssetAgent="ThreeDAssetProcessAgent"
set EnactmentExportAgent="EnactmentExportAgent"
set EnactmentRecordDaemonDispatcher="EnactmentRecordDaemonDispatcher"
set EnactmentRecordDaemon="EnactmentRecordDaemon"
set VideoRecorderDaemonDispatcher="VideoRecordDaemonDispatcher"
set VideoRecorderDaemon="VideoRecordDaemon"
set MeshScanningAgent="MeshScanningAgent"
set RemoteFileSourceProcessAgent="RemoteFileSourceProcessAgent"
set SceneContentPackagingAgent="SceneContentPackagingAgent"
rem ==================================================================================

rem Kill any process with a name that contains part of the agent's name.
rem kill daemons before dispatchers for safety reasons
taskkill /f /fi "IMAGENAME eq %EnactmentRecordDaemon%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %EnactmentRecordDaemonDispatcher%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %VideoRecorderDaemon%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %VideoRecorderDaemonDispatcher%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %ThreeDAssetAgent%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %ApexImageAgent%*" /im *  2>&1 || exit /B 0
@REM taskkill /f /fi "IMAGENAME eq %EnactmentExportAgent%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %MeshScanningAgent%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %RemoteFileSourceProcessAgent%*" /im *  2>&1 || exit /B 0
taskkill /f /fi "IMAGENAME eq %SceneContentPackagingAgent%*" /im *  2>&1 || exit /B 0