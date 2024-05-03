#!/bin/bash

# our program goal is to install MySQL

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

VALIDAE() {
    if [ $1 -ne 0 ]
    then
        echo "Installation encountered an error"
        exit 1
    else
        echo "Installation was successful"
    fi
}

# Install MySQL
yum install mysql -y
VALIDAE $?

# Install postfix
yum install postfix -y
VALIDAE $?
