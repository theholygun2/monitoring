#!/bin/bash

#---Menbambil Data CPU usage
cpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
#-- menukar koma dengan titik supaya dapat dilihat decimal
cpuUsage=`echo "$cpuUsage" | tr ',' '.'`

#---Mengambil Data Memory Ram usage
mem_used=`free -m | grep "Mem" | awk '{print $3}'`

#--Mengambil current date
waktu=`date +'%F %T'`

#-- mengambil traffic upload dan download data
upload=$(speedtest | awk 'BEGIN{ FS=" +|\\(" }; /Upload/{ upl=$2 }; END{ print upl }')
download=$(speedtest | awk 'BEGIN{ FS=" +|\\(" }; /Download/{ dow=$2 }; END{ print dow }')

# Menggunakan Mysql untuk memasukan variable waktu, cpuUsage, mem_used, upload, download ke dalam tabel Monitoring
mysql monitoring -se "INSERT INTO status VALUES(default,'$waktu',$cpuUsage,$mem_used,$upload,$download);"

upload=$(speedtest | awk 'BEGIN{ FS=" +|\\(" }; /Upload/{ upl=$2 }; END{ print upl }')
download=$(speedtest | awk 'BEGIN{ FS=" +|\\(" }; /Download/{ dow=$2 }; END{ print dow }')


#mysql --user="$user" --password="$password" --database="$database" --execute="INSERT INTO status VALUES(default,'$waktu',$cpuUsage,$mem_used);"
