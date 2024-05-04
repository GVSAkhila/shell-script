#!/bin/bash

USERID=$(id -u)

R="\e[32m"

if [[ $USERID -ne 0 ]]
then
    echo -e "$R Please run this script with root user."
    exit 1
fi

yum install git -y
echo "Git installation in progress."
