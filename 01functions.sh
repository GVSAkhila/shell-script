#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){
    if [ $1 -ne 0 ]
then
echo -e "$2 $R Installation fail"
else 
echo -e "$2 $G installation sucess"
fi
}
G="\e[32m"
R="\e[31m"

if [[ $USERID -ne 0 ]]
then
    echo -e "$R Please run this script with root user."
    exit 1
fi

yum install gitt -y &>>$LOGFILE
 
VALIDATE $? "GIT"
yum install mysql -y &>>$LOGFILE
VALIDATE $? "mysql"