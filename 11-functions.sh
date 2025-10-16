#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo "ERROR::please run this script with root access"
else
 echo "you are running this script with root access"
 exit 1
fi

VALIDATE () 
 if [ $1 -ne 0 ]
  then
   echo "$2 installation is failure"
 else
   echo "$2 installation is success"
   exit 1
 fi

dnf list installed mysql
 if [ $? -ne 0 ]
 then 
  echo "mysql is not installed...going to install it"
  dnf install mysql -y
  VALIDATE $? "mysql"
 else
  echo "mysql is already installed..Nothing to do"
 fi 

 dnf list installed python3
 if [ $? -ne 0 ]
 then 
  echo "python3 is not installed...going to install it"
  dnf install python3 -y
  VALIDATE $? "python3"
 else
  echo "python3 is already installed..Nothing to do"
 fi 

 dnf list installed nginx
 if [ $? -ne 0 ]
 then 
  echo "nginx is not installed...going to install it"
  dnf install nginx -y
  VALIDATE $? "nginx"
 else
  echo "nginx is already installed..Nothing to do"
 fi 