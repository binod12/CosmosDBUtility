# CosmosDBUtility
This utility may be used to automate backup and restore for Cosmos DB

In this article we will be going to show steps to do backup and restore using command line utility tool provided by Microsoft i.e. dtutil

## Initial setup
1. Install the dt command line tool from the following location
https://aka.ms/csdmtool

1. Extract the library to a folder
1. Add the extracted folder's path to environment variable Path
1. Check it from the command prompt by running following command

```sh
dt --help
```

1. If the above command runs successfully then you are ready to setup the batch file which will take backup of the cosmos db database collection wise and partitionkey wise

## Settting up of the Batch file
1. main.bat
This file will contain the reference of the actual file that will be used to take the actual backup.
Configure the following variables as per your location where you want to store the backup
```
e.g.: 
set BackupFolder=C:\Backup\%Yr%-%Mon%-%Day%
set OneDriveFolder=C:\Users\<user>\OneDriveFolder\Backup\%Yr%-%Mon%-%Day%
```
At the time of execution it will automatically create current date folder inside the specified location.
If you do not want to configure it for OneDriveFolder, you may ommitt this variable. Accordingly, you need to remove the command of copying file from local drive to onedrive folders also need to be commented out or deleted.



2. backup.bat
Replace the following variables as per your database setup

```
SET COSMOS_DB_ACCOUNT_KEY=<valid cosmos db primary or secondary connection string>
SET DATABASE="<valid cosmos db database name"
SET COLLECTION1="<valid collection name inside the above database"
SET COLLECTION2="<another valid collection name inside the above database>"
```

# Run the batch file
1. Use the following command to run the main.bat file from command prompt. Make sure that both the main.bat and backup.bat file resides in the same directory
```
main.bat
``` 

### Coming up --- Restore and scheduling the entire process