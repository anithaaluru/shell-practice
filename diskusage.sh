#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=1
MSG=" "
while IFS= read line
do
   usage=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
   partition=$(echo $line | awk '{print $7F}')
   if [ $usage -ge $disk_threshold ]
     then
       MSG="There is high disk usage $partition: $usage"
   fi
done <<< $disk_usage
echo "$MSG"
