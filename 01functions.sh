#!/bin/bash

USERID=$(id -u)

G="\e[32m"
R="\e[31m"

if [[ $USERID -ne 0 ]]
then
    echo -e "$R Please run this script with root user."
    exit 1
fi

yum install git -y
echo -e " $G Git installation in progress."
