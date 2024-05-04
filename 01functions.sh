#!/bin/bash

USERID=$(id -u)

R="\e[32m

if [ $USERID -ne 0]
then
echo "$R please run This script with root user"
fi

yum install git -y
echo "git installation in progress"