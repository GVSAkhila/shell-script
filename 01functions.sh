#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
echo "please run This script with root user"
fi

yum install git -y
echo "git installation in progress