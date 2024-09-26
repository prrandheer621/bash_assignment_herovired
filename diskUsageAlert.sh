#!/bin/bash

#Set threshold to 80
THRESHOLD=80

#Set admin email
ADMIN_EMAIL="admin@herovired.com"

#Extract disak percentage usage from df command
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

#Check if usage is greater than threshold.
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    SUBJECT="Disk Usage Alert: Root Filesystem Above $THRESHOLD%"
    MESSAGE="Warning: The root filesystem is ${USAGE}% full. Please take action."
	
	#Mock email sent.
    echo -e "Subject: $SUBJECT\nMessage: $MESSAGE\n\nEmail sent to admin.\n"
fi

