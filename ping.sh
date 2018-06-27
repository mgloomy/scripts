#!/bin/bash
## Set hosts array
declare -a arr=("dev1.ru"
                "dev2.ru"
                "dev3.ru"
                "dev4.ru"
                "dev5.ru"
                "devik.ru"
)

## Set sending count ECHO_REQUEST packets for each host
PING_COUNT="4"
DELIMITER="------------------------------------------------"
## Print header
printf "\n| %-30s | %15s |\n" "Hosts" "Avg latency, ms" 
printf "| %-45s |\n" $DELIMITER
## Loop through the array
for i in "${arr[@]}"
do
  HOST_PING="$(ping -c $PING_COUNT $i | tail -1 | awk '{print $4}' | cut -d '/' -f 2)"
  printf "| %-30s | %15s |\n" "$i" "$HOST_PING"

done
