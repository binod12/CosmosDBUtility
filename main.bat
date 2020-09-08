@echo off

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%

set BackupFolder=C:\Backup\%Yr%-%Mon%-%Day%
set OneDriveFolder=C:\Users\<user>\OneDriveFolder\Backup\%Yr%-%Mon%-%Day%

if not exist "%BackupFolder%" mkdir "%BackupFolder%"
if not exist "%OneDriveFolder%" mkdir "%OneDriveFolder%"

CALL backup.bat <partitionKey>

ROBOCOPY "%BackupFolder%" "%OneDriveFolder%"  /E 






