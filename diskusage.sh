#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=1
MSG=" "
IP=$(curl https://ipecho.net/plain)
while IFS= read line
do
   usage=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
   partition=$(echo $line | awk '{print $7F}')
   if [ $usage -ge $disk_threshold ]
     then
       MSG+="There is high disk usage $partition: $usage \n"
   fi
done <<< $disk_usage
#echo -e "$MSG"
sh mail.sh "devops_team" "high disk usage" "$IP" "$MSG" "anithaaluru99@gmail.com" "ALERT high disk_usage"
