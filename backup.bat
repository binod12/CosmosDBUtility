@echo off

SET COSMOS_DB_ACCOUNT_KEY=<Replace this with the valid cosmos db primary or secondary connection string>
SET DATABASE="Database"
SET COLLECTION1="Collection1"
SET COLLECTION2="Collection2"


echo '1. Backing up %COLLECTION1%'
dt.exe /s:DocumentDB /s.ConnectionString:AccountEndpoint=%ACAD_DB%Database=%DATABASE%; /s.Collection:"COLLECTION1" /s.Query:"Select * from c where c.partitionKey="""%1"""" /t:JsonFile /t.File:%BackupFolder%\%1\%COLLECTION1%.json /t.Prettify /t.Overwrite

echo '2. Backing up %COLLECTION2%'
dt.exe /s:DocumentDB /s.ConnectionString:AccountEndpoint=%ACAD_DB%Database=%DATABASE%; /s.Collection:"COLLECTION2" /s.Query:"Select * from c where c.partitionKey="""%1"""" /t:JsonFile /t.File:%BackupFolder%\%1\%COLLECTION1%.json /t.Prettify /t.Overwrite
