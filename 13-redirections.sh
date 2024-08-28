#!/bin/bash

R="\e[31m"
G="\e[32"
Y="\e[33m"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo -e "$R Please run this script with the root user.$N"
  exit 1
fi

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo -e "$2...$R failed $N"
  else
    echo -e "$2...$R success $N"
  fi
}

for package in "$@"; do
  # Check if the package is installed
  dnf list installed "$package"  
  if [ $? -ne 0 ]; then
    echo -e "R $package is not installed. Let's install it.$N"
    dnf install "$package" -y
    VALIDATE $? "Installing $package"
  else
    echo -e "$Y $package is already installed. Nothing to do.$N"
  fi
done
