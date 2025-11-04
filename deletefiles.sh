#!/bin/bash
USERID=$(id -u)
source_dir=$1
dest_dir=$2
Days=${3:-14}
LOGS_FOLDER="/var/log/delete-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR::please run this script with root access $N"
 exit 1
else
 echo -e "$Y you are running this script with root access $N"
 fi

 if [ $# -lt 2 ]
 then 
  echo "USAGE::sh deletefiles.sh <source-dir> <dest-dir> <days>"
fi

if [ ! -d $source_dir ]
 then
  echo "$G source directory $source_dir does not exist...please check $N"
  exit 1
fi

if [ ! -d $dest_dir ]
 then
  echo "$G destination directory $dest_dir does not exist...please check $N"
  exit 1
fi

Files=$(find $source_dir -name "*.log" -mtime +$days)

if [ ! -z $Files ]
then 
echo "log files are found"
else
 echo "log files are not exist"
fi