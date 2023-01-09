#!/bin/bash
#This script takes a path and displays all files and directories larger than 1GB.
echo "enter path : "
read path
for file in $(ls $path)
do
    if [ -f "$path/$file" ];then

        size=$(wc -c "$path/$file" | awk '{print $1}')

        if [ $size -gt 1000000000 ];then
            echo $file  $size
        fi
    fi
    if [ -d "$path/$file" ];then
    
        size=$(du -b "$path/$file" | cut -f1)

        if [ $size -gt 1000000000 ];then
            echo $file  $size
        fi
    fi
done