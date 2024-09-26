#!/bin/bash

#Schedule at everyday 10:10 AM, via cronjob using crontab -e
#10 10 * * 0-6 sh /home/devops_practice/assignment/compressUserHome.sh

#Get the current user documents path
dirName="/home/$(whoami)/documents"
echo "Creating backup of $dirName"

#Check if directory exists
if [ ! -d $dirName ]; then
    echo "Not a valid directory."
    exit 1
fi

#Backup file name
backupFileName="documents_backup.tar.gz"

#Compress it using tar tool
tar -czvf $backupFileName $dirName

#Give the backup location
backupLocation="/home/$(whoami)/backup/"

#Check if file exists after compression
if [ -f $backupFileName ]; then
    echo "Compression successful, $backupFileName"
	
	#If backup directory doesn't exist, then create a new one
    mkdir -p $backupLocation
	
	#Move the compressed file at the backup location
    mv $backupFileName $backupLocation
else
    echo "Compression failed for $dirName"
fi
