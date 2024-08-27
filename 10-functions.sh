#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Please run this script as root user."
  exit 1
fi

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo "$2... failed"
    exit 1
  else
    echo "$2... succeeded"
  fi
}

# Check and install Git
dnf list installed git  

if [ $? -ne 0 ]; then
  echo "Git is not installed. Installing now..."
  dnf install git -y
  VALIDATE $? "Git installation"
else
  echo "Git is already installed. Nothing to do."
fi

# Check and install MySQL
dnf list installed mysql  
if [ $? -ne 0 ]; then
  echo "MySQL is not installed. Installing now..."
  dnf install mysql -y
  VALIDATE $? "MySQL installation"
else
  echo "MySQL is already installed. Nothing to do."
fi
