#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "please run this script  with root user"
else
  dnf install mysql -y
fi  