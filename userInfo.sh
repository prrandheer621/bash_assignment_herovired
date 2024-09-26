#! /bin/bash

#Get username from id command
username=$(id -u -n)

#Get userid from id command
userid=$(id -u)

#Get groupid from id command
groupid=$(id -g $username)

#Get Home directory path of current user
homeDir=$HOME

#Get shell info being used
shellused=$SHELL

#Display all using echo
echo -e "Username - $username\nUser ID -  $userid\nGroup ID -  $groupid\nHome Directory - $homeDir\nShell being used -  $shellused"
