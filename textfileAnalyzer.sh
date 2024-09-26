#!/bin/bash

#Read file name from user input
read -p "Enter text file to analyze: " file

#Get extension to check if file is txt or not
extension="${file##*.}"

#Check if file exists or not
if [[ ! -f $file ]]; then
    echo "Invalid file. Make sure, the file exists."
    exit 1
fi

#Check extension is valid or not
if [[ $extension != "txt" ]]; then
    echo "Invalid file. Enter a valid filename with *.txt extension."
    exit 1
fi

#Calculate number of lines
lines=$(cat $file | wc -l)

#Calculate number of words
words=$(cat $file | wc -w)

#Calculate number of characters
chars=$(cat $file | wc -m)

#Display the results on screen
echo -e "Count details of $file\nLines: $lines\nWords: $words\nCharacters: $chars"

