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
 else
   echo -e "$2 installation is  $G success $N" | tee -a $LOG_FILE
   exit 1
 fi

dnf list installed mysql &>>$LOG_FILE
 if [ $? -ne 0 ]
 then 
  echo -e "$Y mysql is not installed...going to install it $N" | tee -a $LOG_FILE
  dnf install mysql -y &>>$LOG_FILE
  VALIDATE $? "mysql"
 else
  echo -e "$G mysql is already installed..Nothing to do $N" | tee -a $LOG_FILE
 fi 

 dnf list installed python3 &>>$LOG_FILE
 if [ $? -ne 0 ]
 then 
  echo -e "$Y python3 is not installed...going to install it $N" | tee -a $LOG_FILE
  dnf install python3 -y &>>$LOG_FILE
  VALIDATE $? "python3"
 else
  echo -e "$G python3 is already installed..Nothing to do $N" | tee -a $LOG_FILE
 fi 

 dnf list installed nginx &>>$LOG_FILE
 if [ $? -ne 0 ]
 then 
  echo -e "$Y nginx is not installed...going to install it $N" | tee -a $LOG_FILE
  dnf install nginx -y  &>>$LOG_FILE
  VALIDATE $? "nginx"
 else
  echo -e "$G nginx is already installed..Nothing to do $N" | tee -a $LOG_FILE
 fi 