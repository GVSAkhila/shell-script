#!/bin/bash
LOG_Folder=/var/log/shell-script
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE= "$LOG_Folder/$SCRIPT_NAME/$TIME_STAMP.log"
mkdir -p $LOG_Folder

R="\e[31m"
G="\e[32"
Y="\e[33m"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo -e "$R Please run this script with the root user.$N" |  tree -a $LOG_FILE
fi

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo -e "$2...$R failed $N" | tree -a $LOG_FILE
  else
    echo -e "$2...$G success $N" | tree -a $LOG_FILE
  fi
}

for package in "$@"; do
  # Check if the package is installed
  dnf list installed "$package"  &>>$LOG_FILE
  if [ $? -ne 0 ]; then
    echo -e "$R $package is not installed. Let's install it.$N" &>>$LOG_FILE
    dnf install "$package" -y
    VALIDATE $? "Installing $package" &>>$LOG_FILE
  else
    echo -e "$Y $package is already installed. Nothing to do.$N" | tree -a $LOG_FILE
  fi
done
