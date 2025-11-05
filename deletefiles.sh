#!/bin/bash
USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
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
 USAGE(){
      echo "USAGE::sh deletefiles.sh <source-dir> <dest-dir> <days>"
 }

 if [ $# -lt 3 ]
 then 
   USAGE
   exit 1
fi

if [ ! -d "$SOURCE_DIR" ]
 then
  echo -e "$Y source directory $SOURCE_DIR does not exist.please check $N"
  exit 1
fi

if [ ! -d "$DEST_DIR" ]
 then
  echo -e "$Y destination directory $DEST_DIR does not exist.please check $N"
  exit 1
fi

Files=$(find "$SOURCE_DIR" -name "*.log" -mtime +$Days)

if [ ! -z $Files ]
then 
echo "log files are found"
else
 echo "log files are not exist"
fi