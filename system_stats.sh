#!/bin/bash

#---cpu
cpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
#---mem
mem_used=`free -m | grep "Mem" | awk '{print $3}'`

echo "`date` CPU usage: $cpuUsage | RAM usage: $mem_used MB"


#---disk
disk_usage () {
disk_use=`df -P | grep /dev | grep -v -E '(tmp|boot)' | awk '{print $5}' | cut -f 1 -d "%"`
 echo "disk usage : $disk_use"

}
