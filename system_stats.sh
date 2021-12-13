#!/bin/bash

user="dbadmin"
password="inidbadmin"
database="monitoring"

#---cpu
cpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
#cpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

#---mem
mem_used=`free -m | grep "Mem" | awk '{print $3}'`

waktu=`date +'%F %T'`
cpuUsage=`echo "$cpuUsage" | tr ',' '.'`

#mysql --user="$user" --password="$password" --database="$database" --execute="INSERT INTO status VALUES(default,'$waktu',$cpuUsage,$mem_used);"
mysql monitoring -se "INSERT INTO status VALUES(default,'$waktu',$cpuUsage,$mem_used);"

#---disk
# disk_usage () {
# disk_use=`df -P | grep /dev | grep -v -E '(tmp|boot)' | awk '{print $5}' | cut -f 1 -d "%"`
#  echo "disk usage : $disk_use"
# }
