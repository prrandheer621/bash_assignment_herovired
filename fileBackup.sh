#! /bin/bash

#Take entry of sourcepath
read -p "Enter directory path: " sourcePath

#Check if entered directory is valid or not
if [ ! -d "$sourcePath" ]; then
   echo "Invalid directory name."
   exit 1
fi

#Check count of text file
fileCount=$(ls *.txt | wc -l)

#If filecount is greater than 1, then start backup process.
if [ $fileCount -ge 1 ]; then
	
	#Create destination path with timestamp.
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    destPath="$sourcePath/backup_$TIMESTAMP"
	
	#Create destination path, if it doesn't exist.
    mkdir -p "$destPath"
    echo "$fileCount files are going to be copied to $destPath"
	
	#Copy file recurcively if it is a text file to the destination path.
    for file in "$sourcePath"/*.txt; do
        cp "$file" "$destPath"
    done
    echo "Backup successful."
fi
