#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
echo" Error:please run this script with root user"
exit 1
fi
yum install musql -y