#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "please run this script  with root user"
else
  dnf install mysqll -y
    if [ $? -ne 0 ]
    then
     echo "mysql package is installed sucessfully"
     exit 1
    else
      echo "mysql package is failed please check"  
      exit 1
    fi  
fi