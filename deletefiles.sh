#!/bin/bash
USERID=$(id -u)
source_dir=$1
dest_dir=$2
Days=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/delete-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR::please run this script with root access $N"
 exit 1
else
 echo -e "$Y you are running this script with root access $N"
 fi

