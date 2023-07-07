#!/bin/bash
# This script generates a report of memory use

echo $(hostname)
echo "RAM (GB)"
free -g
echo " "
echo "TOP 10 MEM SWAP"
echo "PID PROC USO"
echo "=============="
for file in /proc/*/status ; do echo $(echo $file | grep -oE "[0-9]+") $(awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file); done 2> /dev/null | sort -k 3 -n -r | head
echo " "
echo "TOP MEMORY"
echo "=========="
ps aux --sort=-%mem | head -n 20
