#!/bin/bash

#Take input of process name from user
read -p "Enter service name to check if its running: " processName

#Get port count, it will greater than 0, if running.
portCount=$(pgrep $processName | wc -l)

if [ $portCount -gt 0 ]; then
    echo "$processName is running."
else
    echo -e "$processName is not running.\nStarting service $processName"
    
    #Try to start the process, if it fails, then store the msg in error variable
    error=$(systemctl start $processName 2>&1) 
    recheckPortCount=$(pgrep $processName | wc -l)
    if [ $recheckPortCount -gt 0 ]; then
	succMsg="$processName started successfully."
	echo $succMsg
	
	#Write the success message in logs.txt
	echo $succMsg >> logs.txt
    else
	echo "$error"

	#Write the error message in logs.txt
	echo "$error" >> logs.txt
    fi
fi    
