#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
 mkdir -p $LOGS_FOLDER
 echo "script started  executed at:$(date)" | tee -a $LOG_FILE
#  PACKAGES=("mysql" "python3" "nginx" "httpd")

if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR::please run this script with root access $N" | tee -a $LOG_FILE
 exit 1
else
 echo -e "$Y you are running this script with root access $N" | tee -a $LOG_FILE
 fi

VALIDATE () 
 if [ $1 -ne 0 ]
  then
   echo -e "$2 installation is $R failure $N" | tee -a $LOG_FILE
   exit 1
 else
   echo -e "$2 installation is  $G success $N" | tee -a $LOG_FILE
 fi

# for packages in ${PACKAGES[@]}
for packages in $@
  do
    dnf list installed $packages &>>$LOG_FILE
    if [ $? -ne 0 ]
 then 
  echo -e "$packages is not installed...going to install it $N" | tee -a $LOG_FILE
  dnf install $packages -y &>>$LOG_FILE
  VALIDATE $? "$packages"
 else
  echo -e "$G $packages is already installed..Nothing to do $N" | tee -a $LOG_FILE
 fi 
 done

