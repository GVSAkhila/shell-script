#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
  echo -e "$R Please run this script with root privilages$N"
  exit 1
fi
dnf intall mysql -y

if [$? -ne 0 ]
then
echo -e  "$G mysql is not installed.lates do now $N"
 exit 1
else
echo -e "$G mysql is installed.sucessfully $N"
fi