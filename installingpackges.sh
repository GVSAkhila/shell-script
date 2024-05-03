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

# it is our responsibility again to check installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
echo"MYSQL INSTALLATION is fail"
else
echo"MYSQL INSTALLATION is sucess"
fi

yum install git -y

if [ $? -ne 0 ]
then 
echo" GIT INSTALLATION is fail"
else
echo"GIT INSTALLATION is sucess"
fi
