#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
  echo "please run this script with root privelages"
  exit 1
fi
dnf list installed gitt 
if [ $? -ne 0 ]
then
  echo "Git is not installed.lets do it"
  dnf install gitt -y
if [ $? -ne 0 ]
then
   echo "git installations is failed.please check"
   exit 1
else
    echo "git installation is sucess"
    exit 1
fi
else
   echo "git is All ready installed.Thanks for checking"
fi     