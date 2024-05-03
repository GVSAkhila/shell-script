#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
# else
#     echo "INFO:: You are root user"
fi
VALIDAE(){
    if [ $? -ne 0 ]
    then
     echo "Installation of  is error"
    exit 1
    else 
     echo "Installation of mysql is sucess"
    exit 1
}

# it is our responsibility again to check installation is success or not
yum install mysql -y
VALIDAE

yum install postfix -y

VALIDAE