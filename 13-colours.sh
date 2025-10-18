#!/bin/bash
USERID=$(id -u)
R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"
if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR::please run this script with root access $N"
 exit 1
else
 echo " $Y you are running this script with root access $N"
 fi

VALIDATE () 
 if [ $1 -ne 0 ]
  then
   echo "$2 installation is $R failure $N"
 else
   echo "$2 installation is  $G success $N"
   exit 1
 fi

dnf list installed mysql
 if [ $? -ne 0 ]
 then 
  echo "$Y mysql is not installed...going to install it $N"
  dnf install mysql -y
  VALIDATE $? "mysql"
 else
  echo "$G mysql is already installed..Nothing to do $N"
 fi 

 dnf list installed python3
 if [ $? -ne 0 ]
 then 
  echo "$Y python3 is not installed...going to install it $N"
  dnf install python3 -y
  VALIDATE $? "python3"
 else
  echo "$G python3 is already installed..Nothing to do $N"
 fi 

 dnf list installed nginx
 if [ $? -ne 0 ]
 then 
  echo "$Y nginx is not installed...going to install it $N"
  dnf install nginx -y
  VALIDATE $? "nginx"
 else
  echo "$G nginx is already installed..Nothing to do $N"
 fi 