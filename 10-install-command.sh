#!bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
 then 
  echo "ERROR:: please run this script with root access"
  exit 1
else
  echo "you are running this script with root access"
fi
dnf install mysql -y
if [ $? -eq 0 ]
then 
 echo "Installing MYSQL is... success"
else
 echo "Installing MYSQL is... failure"
 exit 1
fi