#!/bin/bash

$USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
  echo "please run this script with root privelages"
  exit 1
fi
dnf list installed git 
if [ $? -ne 0 ]
then
  echo "Git is not installed.lets do it"
  dnf install git -y
else
   echo "git is All ready installed.Thanks for checking"
fi     