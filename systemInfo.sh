#!/bin/bash

#Get system uptime info
upTime=$(uptime)
bootTime=$(uptime -s)
upTimeInHoursMins=$(uptime -p)

#Get system memory usage info
memoryUsage=$(free -m)

#Get load info
loadAvg1Min=$(echo $upTime | awk '{print $8}')
loadAvg5Min=$(echo $upTime | awk '{print $9}')
loadAvg15Min=$(echo $upTime | awk '{print $10}')


#Get root disk info
rootDiskInfo=$(df -h /)

#Get 2nd row using awk NR==2 from rootDiskInfo, and extract total, used, free  size of disk
totalDiskSize=$(df -h / | awk 'NR==2 {print $2}')
totalDiskUsed=$(df -h / | awk 'NR==2 {print $3}')
totalDiskFree=$(df -h / | awk 'NR==2 {print $4}')

#Get running processes
processRunning=$(ps aux)

#Create report
report="
System Uptime: $upTimeInHoursMins
Memory Usage: $memoryUsage
CPU Load:
  1 min Load Avg: $loadAvg1Min
  5 min Load Avg: $loadAvg5Min
  15 min Load Avg: $loadAvg15Min

Disk Usage:
  Total Size of Disk: $totalDiskSize
  Used Disk Space: $totalDiskUsed
  Free Disk Space: $totalDiskFree

Running Processes:
$processRunning
"
#Write output to file
echo "$report" > system_report.txt

