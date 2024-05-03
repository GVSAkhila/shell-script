#!/bin/bash

# our program goal is to install MySQL

USERID=$(id -u)
DATE=$(date +%F) 
SCRIPT_NAME=$0
LOGFILE=/tmp/SCRIPT_NAME-$DATE.log

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

VALIDAE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 encountered an error"
        exit 1
    else
        echo "$2 was successful"
    fi
}

# Install MySQL
yum install mysql -y &>>LOGFILE
VALIDAE $? "installing mysql"

# Install postfix
yum install postfix -y &>>LOGFILE
VALIDAE $? "installing postfix"
