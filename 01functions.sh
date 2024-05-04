#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

G="\e[32m"
R="\e[31m"

if [[ $USERID -ne 0 ]]
then
    echo -e "$R Please run this script with root user."
    exit 1
fi

yum install gitt -y &>>$LOGFILE
 
if [ $? -ne 0 ]
then
echo -e "$R Installation fail"
else 
echo -e "$G installation sucess"
fi